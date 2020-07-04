package redirect;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean
@RequestScoped
public class navegador {

	//private AdministraVista administrador;
	AdministraVista administrador =new AdministraVista();
	
	public String metodo1() {
		return "nosotros";
	}
	
	
	public void metodo2() {
		administrador.presentarInterfaz(0);;

	}
	
	
	public navegador() {
		// TODO Auto-generated constructor stub
		//this.administrador = new AdministraVista();
	}

}
