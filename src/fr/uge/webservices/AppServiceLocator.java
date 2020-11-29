/**
 * AppServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package fr.uge.webservices;

public class AppServiceLocator extends org.apache.axis.client.Service implements fr.uge.webservices.AppService {

    public AppServiceLocator() {
    }


    public AppServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public AppServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for App
    private java.lang.String App_address = "http://localhost:8080/IfsCar/services/App";

    public java.lang.String getAppAddress() {
        return App_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String AppWSDDServiceName = "App";

    public java.lang.String getAppWSDDServiceName() {
        return AppWSDDServiceName;
    }

    public void setAppWSDDServiceName(java.lang.String name) {
        AppWSDDServiceName = name;
    }

    public fr.uge.webservices.App getApp() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(App_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getApp(endpoint);
    }

    public fr.uge.webservices.App getApp(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            fr.uge.webservices.AppSoapBindingStub _stub = new fr.uge.webservices.AppSoapBindingStub(portAddress, this);
            _stub.setPortName(getAppWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setAppEndpointAddress(java.lang.String address) {
        App_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (fr.uge.webservices.App.class.isAssignableFrom(serviceEndpointInterface)) {
                fr.uge.webservices.AppSoapBindingStub _stub = new fr.uge.webservices.AppSoapBindingStub(new java.net.URL(App_address), this);
                _stub.setPortName(getAppWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("App".equals(inputPortName)) {
            return getApp();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://webservices.uge.fr", "AppService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://webservices.uge.fr", "App"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("App".equals(portName)) {
            setAppEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
