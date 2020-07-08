package pl.forte.technikaldata.machine;

import org.springframework.core.convert.converter.Converter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.forte.technikaldata.documentation.Document;
import pl.forte.technikaldata.documentation.DocumentDao;

@Component
public class MachineConverter implements Converter<String, Document> {

    @Autowired
    private DocumentDao documentDao;

    @Override
    public Document convert(String source) {
        return documentDao.find(Long.parseLong(source));
    }
}
