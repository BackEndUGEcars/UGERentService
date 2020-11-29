/**
 * App.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package fr.uge.webservices;

public interface App extends java.rmi.Remote {
    public boolean connect(java.lang.String login, java.lang.String password) throws java.rmi.RemoteException;
    public java.lang.String getQueue(long carId) throws java.rmi.RemoteException;
    public java.lang.String getNotifications() throws java.rmi.RemoteException;
    public boolean isCurrentlyRented(long carId) throws java.rmi.RemoteException;
    public boolean myConnection() throws java.rmi.RemoteException;
    public boolean removeNotification(long carId) throws java.rmi.RemoteException;
    public java.lang.String basketToJSON() throws java.rmi.RemoteException;
    public boolean removeFromCart(long carId) throws java.rmi.RemoteException;
    public boolean addToCart(long carId) throws java.rmi.RemoteException;
    public boolean isInCart(long carId) throws java.rmi.RemoteException;
    public java.lang.String getAllCars() throws java.rmi.RemoteException;
    public int rent(long carId) throws java.rmi.RemoteException;
    public int unrent(long carId, float note, float cleanlinessNote) throws java.rmi.RemoteException;
    public java.lang.String getMyCars() throws java.rmi.RemoteException;
}
