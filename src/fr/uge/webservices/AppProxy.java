package fr.uge.webservices;

public class AppProxy implements fr.uge.webservices.App {
  private String _endpoint = null;
  private fr.uge.webservices.App app = null;
  
  public AppProxy() {
    _initAppProxy();
  }
  
  public AppProxy(String endpoint) {
    _endpoint = endpoint;
    _initAppProxy();
  }
  
  private void _initAppProxy() {
    try {
      app = (new fr.uge.webservices.AppServiceLocator()).getApp();
      if (app != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)app)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)app)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (app != null)
      ((javax.xml.rpc.Stub)app)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public fr.uge.webservices.App getApp() {
    if (app == null)
      _initAppProxy();
    return app;
  }
  
  public boolean connect(java.lang.String login, java.lang.String password) throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.connect(login, password);
  }
  
  public java.lang.String getQueue(long carId) throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.getQueue(carId);
  }
  
  public java.lang.String getNotifications() throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.getNotifications();
  }
  
  public boolean isCurrentlyRented(long carId) throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.isCurrentlyRented(carId);
  }
  
  public boolean myConnection() throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.myConnection();
  }
  
  public boolean removeNotification(long carId) throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.removeNotification(carId);
  }
  
  public java.lang.String basketToJSON() throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.basketToJSON();
  }
  
  public boolean removeFromCart(long carId) throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.removeFromCart(carId);
  }
  
  public boolean addToCart(long carId) throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.addToCart(carId);
  }
  
  public boolean isInCart(long carId) throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.isInCart(carId);
  }
  
  public java.lang.String getAllCars() throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.getAllCars();
  }
  
  public int rent(long carId) throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.rent(carId);
  }
  
  public int unrent(long carId, float note, float cleanlinessNote) throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.unrent(carId, note, cleanlinessNote);
  }
  
  public java.lang.String getMyCars() throws java.rmi.RemoteException{
    if (app == null)
      _initAppProxy();
    return app.getMyCars();
  }
  
  
}