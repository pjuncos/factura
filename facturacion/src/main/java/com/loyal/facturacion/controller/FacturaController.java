package com.loyal.facturacion.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.http.*;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;

import com.loyal.facturacion.dao.FacturaDAO;
import com.loyal.facturacion.dao.PersonaDAO;
import com.loyal.facturacion.dto.FacturaHeadListDTO;
import com.loyal.facturacion.model.Persona;
import com.loyal.facturacion.model.factura.Factura;
import com.loyal.facturacion.validator.FacturaValidator;

@Controller
@RequestMapping(value="/facturas")

public class FacturaController{

	@Autowired
	FacturaDAO facturaDAO;
	
	@Autowired
	PersonaDAO personaDAO;

	@RequestMapping(method=RequestMethod.GET)
	public @ResponseBody Map<String, Collection<FacturaHeadListDTO>> list(){
		Map<String, Collection<FacturaHeadListDTO>> results = new HashMap<String, Collection<FacturaHeadListDTO>>();
		results.put("invoice", facturaDAO.getAll());
		return results;
	}

	@RequestMapping(method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public @ResponseBody ResponseMessage create(@Valid @RequestBody Factura factura){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Persona usuario = personaDAO.findByUsername(authentication.getName());
		factura.setIdUsuario(usuario.getId());
		facturaDAO.insert(factura);
		return new ResponseMessage(ResponseMessageType.OK);
	}

	@RequestMapping(value="/{idTipo}-{numero}",method=RequestMethod.GET)
	public @ResponseBody Factura find(@PathVariable Integer idTipo, @PathVariable Long numero){
		return facturaDAO.findById(idTipo, numero);
	}

	@RequestMapping(value="/{idTipo}-{numero}",method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody ResponseMessage update(@PathVariable Integer idTipo, @PathVariable Long numero, @Valid @RequestBody Factura factura){
		facturaDAO.update(factura);
		return new ResponseMessage(ResponseMessageType.OK);
	}

	@RequestMapping(value="/{idTipo}-{numero}",method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody ResponseMessage delete(@PathVariable Integer idTipo, @PathVariable Long numero){
		facturaDAO.deleteById(idTipo, numero);
		return new ResponseMessage(ResponseMessageType.OK);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder, WebRequest webRequest){ 
		binder.setValidator(new FacturaValidator());
	}
	
}
