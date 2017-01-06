package website.common;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ParseXml {

    public static String getSqlByName(String sqlName) throws Exception {
        Resource resource = new ClassPathResource("Sql.xml");
        SAXReader reader = new SAXReader();
        Document document = reader.read(resource.getFile());
        Element rootElement = document.getRootElement();
        Element sqlElement = rootElement.element(sqlName);
        return sqlElement.getStringValue();
    }

}
