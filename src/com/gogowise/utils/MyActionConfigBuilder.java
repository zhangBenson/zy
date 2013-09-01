package com.gogowise.utils;


import com.opensymphony.xwork2.ObjectFactory;
import com.opensymphony.xwork2.config.Configuration;
import com.opensymphony.xwork2.inject.Container;
import com.opensymphony.xwork2.inject.Inject;
import com.opensymphony.xwork2.util.finder.ClassFinder;
import com.opensymphony.xwork2.util.finder.Test;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.PackageBasedActionConfigBuilder;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * Solve the problem that could not found action under JBoss.
 *
 * @author <a href="mailto:sunyi4j@gmail.com">Roy</a> on Jul 6, 2009
 */

public class MyActionConfigBuilder extends PackageBasedActionConfigBuilder {
    private static Log log = LogFactory.getLog(MyActionConfigBuilder.class);
    private static final String BASE_FILE = "applicationContext.xml";


    /**
     * Constructs actions based on a list of packages.
     *
     * @param configuration        The XWork configuration that the new package configs and action configs
     *                             are added to.
     * @param container            Xwork Container
     * @param objectFactory        The ObjectFactory used to create the actions and such.
     * @param redirectToSlash      A boolean parameter that controls whether or not this will create an
     *                             action for indexes. If this is set to true, index actions are not created because
     *                             the unknown handler will redirect from /foo to /foo/. The only action that is created
     *                             is to the empty action in the namespace (e.g. the namespace /foo and the action "").
     * @param defaultParentPackage The default parent package for all the configuration.
     */
    @Inject
    public MyActionConfigBuilder(
            Configuration configuration,
            Container container,
            ObjectFactory objectFactory,
            @Inject("struts.convention.redirect.to.slash") String redirectToSlash,
            @Inject("struts.convention.default.parent.package") String defaultParentPackage) {
        super(configuration,
                container,
                objectFactory,
                redirectToSlash,
                defaultParentPackage);
    }


    @Override
    protected Set<Class> findActions() {
        Set<Class> classes = new HashSet<Class>();
        classes.addAll(super.findActions());
        try {
            // By default, ClassFinder scans EVERY class in the specified
            // url set, which can produce spurious warnings for non-action
            // classes that can't be loaded. We pass a package filter that
            // only considers classes that match the action packages
            // specified by the user
            Test<String> classPackageTest = getClassPackageTest();
            ClassFinder finder = new ClassFinder(getClassLoaderInterface(), this.buildUrls(), true, new HashSet<String>(), classPackageTest);
            Test<ClassFinder.ClassInfo> test = getActionClassTest();
            classes.addAll(finder.findClasses(test));
        } catch (Exception ex) {
            if (log.isErrorEnabled()) {
                log.error("Unable to scan named packages", ex);
            }
        }
        return classes;
    }


    private List<URL> buildUrls() throws MalformedURLException {
        List<URL> urls = new ArrayList<URL>();
        URL classesUrl = getClassLoader().getResource(BASE_FILE);
        if (classesUrl == null) {
            throw new IllegalStateException("File applicationContext.xml was not found. The folder WEB-INF/classes discovery base on file classes/applicationContext.xml.");
        }
        String baseFilePath = classesUrl.getFile();
        URL url = new URL("file", "", baseFilePath.substring(0, baseFilePath.indexOf(BASE_FILE)));
        if (log.isInfoEnabled()) {
            log.info("Struts2 ActionConfigBuilder, classes directory:" + url.getFile());
        }
        urls.add(url);

        return urls;

    }

}
