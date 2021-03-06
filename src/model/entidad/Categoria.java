package model.entidad;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Entidad categoria
 * @author HIBAN
 *
 */
@XmlRootElement
public class Categoria {
	private int id;
	private String nombre;
	
	//Constructores
	public Categoria() {
		super();
	}

	public Categoria(int id, String nombre) {
		super();
		this.id = id;
		this.nombre = nombre;
	}

	//Getters y Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	
}
