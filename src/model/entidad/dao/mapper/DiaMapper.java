package model.entidad.dao.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import model.entidad.Dia;

/**
 * Interfaz del mapper de la entidad Dia
 * 
 * @author HIBAN
 *
 */
public interface DiaMapper {
	public Dia DiaPorId(@Param("id") int id);

	public ArrayList<Dia> horarioUsuario(@Param("usuario") int idUsuario, @Param("mes") int mes,
			@Param("anyo") int anyo);

}
