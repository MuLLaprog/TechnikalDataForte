package pl.forte.technikaldata.documentation;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class DocumentDao {

    @PersistenceContext
    private EntityManager entityManager;

    public Document find(Long id) {
        return entityManager.find(Document.class, id);
    }

    public void save(Document document) {
        entityManager.persist(document);
    }

    public void update(Document document) {
        entityManager.merge(document);
    }

    public void delete(Long id) {
        Document document = find(id);
        if (document != null) {
            entityManager.remove(document);
        }
    }

    public List<Document> findAllDocuments() {
        Query query = entityManager.createQuery("SELECT d FROM Document d");
        return query.getResultList();
    }

    public List<Document> findAllDocumentsMachine(Long id) {
        Query query = entityManager.createQuery("SELECT d FROM Document d where d.machine = " + id);
        return query.getResultList();
    }

    public void allDocumentationsDelete(Long idMach) {
        List<Document> listDocument = findAllDocumentsMachine(idMach);
        for (Document doc : listDocument) {
                delete(doc.getId());
        }
    }
}
