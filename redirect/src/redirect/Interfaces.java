package redirect;

public class Interfaces {
		
	private String interfaces[];
	
	
	public Interfaces() {
		// TODO Auto-generated constructor stub
		this.interfaces=new String[5];
		this.interfaces[0]="arequipa.xhtml";
		this.interfaces[1]="chiclayo.xhtml";
		this.interfaces[2]="trujillo.xhtml";
	}
	public String obtenerNombreInterfaz(int numeroInterfaz){
		 return this.interfaces[numeroInterfaz];
		 }

}
