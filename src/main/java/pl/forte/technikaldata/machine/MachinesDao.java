package pl.forte.technikaldata.machine;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class MachinesDao {

    @PersistenceContext
    private EntityManager entityManager;

    public Machine find(Long id) {
        return entityManager.find(Machine.class, id);
    }

    public void save(Machine machine) {
        entityManager.persist(machine);
    }

    public void update(Machine machine) {
        entityManager.merge(machine);
    }

    public void delete(Long id) {
        Machine machine = find(id);
        if (machine != null) {
            entityManager.remove(machine);
        }
    }

    public List<Machine> findAllMachines() {
        Query query = entityManager.createQuery("SELECT m FROM Machine m");
        return query.getResultList();
    }
}
