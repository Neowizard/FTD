package Main;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

public class ConfigurationManager {
    private String configFilePath;
    private Properties properties = new Properties();

    public ConfigurationManager(String configFilePath) throws IOException {
        this.configFilePath = configFilePath;

        FileInputStream fis = null;
        try {
            fis = new FileInputStream(configFilePath);
            properties.loadFromXML(fis);
        } catch (FileNotFoundException ex) {
            // creates the configuration file and set default properties
            setDefaults();
            save();
        } finally {
            if (fis != null) {
                fis.close();
            }
        }
    }

    private void setDefaults() {
        properties.put("k", "1");
        properties.put("domain", "./ProbFiles/domain_template.xml");
        properties.put("problem", "./ProbFiles/problem_template.xml");

        properties.put("domName", "DomName");
        properties.put("probName", "Problem_01");

        properties.put("domOutput", "./ProbFiles/outputDom.pddl");
        properties.put("probOutput", "./ProbFiles/outputProb.pddl");

    }

    public void save() throws IOException {
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(configFilePath);
            properties.storeToXML(fos, "My Application Settings");
        } finally {
            if (fos != null)
                fos.close();
        }

    }

    public String getProperty(String key) {
        return properties.getProperty(key);
    }

    public String getProperty(String key, String defaultValue) {
        return properties.getProperty(key, defaultValue);
    }

    public void setProperty(String key, String value) {
        properties.setProperty(key, value);
    }
}
