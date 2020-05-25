package model.entidad.dao.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import model.entidad.HoraVenta;

public interface HoraVentaMapper {

	public HoraVenta ventaPorId(@Param("id") int id);

	public ArrayList<HoraVenta> getVentas();

}
