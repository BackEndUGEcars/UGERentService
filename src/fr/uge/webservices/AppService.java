/**
 * AppService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package fr.uge.webservices;

public interface AppService extends javax.xml.rpc.Service {
    public java.lang.String getAppAddress();

    public fr.uge.webservices.App getApp() throws javax.xml.rpc.ServiceException;

    public fr.uge.webservices.App getApp(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
