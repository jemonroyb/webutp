package redirect;

import java.io.IOException;

import javax.faces.context.FacesContext;


public class AdministraVista {

	public AdministraVista() {
		// TODO Auto-generated constructor stub
	}

	 public void presentarInterfaz( int interfaceId ) {
		 try{
		 Interfaces listaInterfaces = new Interfaces();
		 FacesContext.getCurrentInstance().getExternalContext()
		 .redirect(listaInterfaces.obtenerNombreInterfaz(interfaceId));

		 } catch (IOException ex) {
		 System.out.println("Error");
		 }
		}
	
	
}
