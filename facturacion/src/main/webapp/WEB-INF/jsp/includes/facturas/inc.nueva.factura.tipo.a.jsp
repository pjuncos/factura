<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <script id="tmpl-fc-a-invoice" type="text/template">
		<div id="factura-nueva" class="main-panel">
		
		  <ol class="breadcrumb">
		    <li><a href="#"><span class="glyphicon glyphicon-home"></span> Dashboard</a></li>
		    <li><a href="#facturas">Facturas</a></li>
		    <li class="active">Nueva</li>
		  </ol>
		
		  <section class="row">
		   <div class="col-md-12 clearfix">
		      <div class="panel panel-default">
		        <div class="panel-heading">
		          Creaci&oacute;n de factura tipo A
		        </div>
		        <div class="panel-body">
		          <form role="form">
		            <fieldset>
		
		              <div class="row">
		
		                <!-- columna nro. 1 -->
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Cliente</label>
		                    <input type="text" class="form-control form-type-client" placeholder="Buscar cliente...">
		                  </div>
		                  <div class="form-group">
		                    <label for="">Localizaci&oacute;n / Sucursal</label>
		                    <input type="text" class="form-control" placeholder="Ingresar sucursal">
		                  </div>
		                  <div class="form-group">
		                    <label for="">Contacto</label>
		                    <input type="text" class="form-control" placeholder="Ingresar contacto">
		                  </div>
		                  <div class="form-group">
		                    <label for="">Situaci&oacute;n ante el IVA</label>
		                    <select class="form-control">
		                      <option>Responsable inscripto</option>
		                      <option>No inscripto</option>
		                      <option>Excento</option>
		                      <option>Consumidor final</option>
		                    </select>
		                  </div>
		                  <div class="form-group">
		                    <label for="">CUIT</label>
		                    <input type="text" class="form-control" placeholder="Ingresar CUIT">
		                  </div>
		                  <div class="form-group">
		                    <label for="">Retenci&oacute;n</label>
		                    <select class="form-control">
		                      <option>Sin retenci&oacute;n</option>
		                      <option>50%</option>
		                      <option>80%</option>
		                    </select>
		                  </div>
		                </div>
		
		                <!-- columna nro. 2 -->
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Fecha</label>
		                    <div class="input-group">
		                      <input type="text" class="form-control form-datepicker input-fecha-emision" name="fecha" /s>
		                      <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                      </span>
		                    </div>
		                  </div>
		                  <div class="form-group">
		                    <label for="">Fecha vencimiento</label>
		                    <div class="input-group">
		                      <input type="text" class="form-control form-datepicker input-fecha-vencimiento" name="fecha_vencimiento"/>
		                      <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                      </span>
		                    </div>
		                  </div>
		                  <div class="form-group">
		                    <label for="">Fecha probable de cobro</label>
		                    <div class="input-group">
		                      <input type="text" class="form-control form-datepicker">
		                      <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                      </span>
		                    </div>
		                  </div>
		                  <div class="form-group">
		                    <label for="">Fecha cobro</label>
		                    <div class="input-group">
		                      <input type="text" class="form-control form-datepicker">
		                      <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                      </span>
		                    </div>
		                  </div>
		                </div>
		
		                <!-- columna nro. 3 -->
		                <div class="col-md-4 clearfix">
		                   <div class="form-group">
		                      <label for="">Status</label>
		                      <select class="form-control select-status">
		                        <option>A cobrar</option>
		                        <option>Cobrada</option>
		                        <option>A facturar</option>
		                        <option>Dar de baja</option>
		                        <option>Anulada</option>
		                      </select>
		                    </div>  
		                    <div class="form-group">
		                      <label for="">Sub Total</label>
		                      <input type="text" class="form-control" placeholder="Ingresar sub total">
		                    </div> 
		                    <div class="form-group">
		                      <label for="">IVA</label>
		                      <input type="text" class="form-control" placeholder="Ingresar IVA">
		                    </div>  
		                    <div class="form-group">
		                        <label for="">Total</label>
		                        <div class="input-group">
		                          <input type="text" class="form-control">
		                          <span class="input-group-addon">
		                            %
		                          </span>
		                        </div>                                                     
		                    </div>                                                     
		                </div>
		
		                <div class="col-md-12 clearfix">
		                  <hr>
		                </div>
		
		                <!-- labels -->
		                <div class="col-md-4 clearfix">
		                  <p>
		                    <label>Status Cobro:</label> 
		                    <span class="label label-success label-xs label-status">A cobrar</span>
		                  </p>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <p>
		                    <label>Fecha Provista de Emision:</label> 
		                    <span class="label label-success label-xs label-emision">-</span>
		                  </p>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <p>
		                    <label>Fecha de Vencimiento:</label> 
		                    <span class="label label-success label-xs label-vencimiento">-</span>
		                  </p>
		                </div>
		
		                <!-- comision -->
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">% Comisi&oacute;n</label>
		                    <select class="form-control">
		                      <option>0</option>
		                      <option>1.0</option>
		                      <option>2.0</option>
		                      <option>3.0</option>
		                      <option>4.0</option>
		                      <option>5.0</option>
		                      <option>6.0</option>
		                      <option>7.0</option>
		                      <option>8.0</option>
		                      <option>9.0</option>
		                      <option>10.0</option>
		                      <option>3.5</option>
		                    </select>
		                  </div>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Comisi&oacute;n</label>
		                    <input type="text" class="form-control" placeholder="Ingesar comisi&oacute;n">
		                  </div>
		                </div>
		
		                <div class="col-md-12 clearfix"></div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Cobrado</label>
		                    <select class="form-control">
		                      <option>No</option>
		                      <option>Si</option>
		                    </select>
		                  </div>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Fecha comprobante entregable</label>
		                    <div class="input-group">
		                      <input type="text" class="form-control form-datepicker">
		                      <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                      </span>
		                    </div>
		                  </div>                          
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Tipo de comprobante entregable</label>
		                    <select class="form-control">
		                      <option>Valor 1</option>
		                      <option>Valor 2</option>
		                    </select>
		                  </div>
		                </div>
		
		                <div class="col-md-12 clearfix">
		                  <label>Responsble por Loyal</label>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Nombre</label>
		                    <input type="text" class="form-control" placeholder="Buscar nombre...">
		                  </div>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Area</label>
		                    <select class="form-control">
		                      <option>Administraci&oacute;n</option>
		                      <option>Ventas</option>
		                      <option>T&eacute;cnica</option>
		                      <option>Servicios</option>
		                    </select>
		                  </div>
		                </div>
		
		                <div class="col-md-12 clearfix"></div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Linea de producto</label>
		                    <select class="form-control">
		                      <option>Actualizaci&oacute;n</option>
		                      <option>Licencias</option>
		                      <option>Soporte</option>
		                      <option>Proyectos Veraz</option>
		                      <option>Mantenimiento Veraz</option>
		                      <option>Viaticos</option>
		                    </select>
		                  </div>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Costo</label>
		                    <input type="text" class="form-control" placeholder="Ingresar costo">
		                  </div>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Rentabilidad</label>
		                    <input type="text" class="form-control" placeholder="Ingresar rentabilidad">
		                  </div>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Forma de pago</label>
		                    <input type="text" class="form-control" placeholder="Ingresar forma de pago">
		                  </div>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Remito</label>
		                    <input type="text" class="form-control" placeholder="Ingresar remito">
		                  </div>
		                </div>
		
		                <div class="col-md-4 clearfix">
		                  <div class="form-group">
		                    <label for="">Orden de compra</label>
		                    <input type="text" class="form-control" placeholder="Ingresar orden de compra">
		                  </div>
		                </div>
		
		                <div class="col-md-12 clearfix">
		                  <hr>
		                </div>
		
		                <div class="col-md-12 clearfix">
							
							<button type="button" class="btn btn-primary btn-table-insert" data="append">
		                    	<span class="glyphicon glyphicon-th-list"></span>
		                       	Insertar fila
		                    </button> 
		                      <button type="button" class="btn btn-primary btn-table-reset">
		                        <span class="glyphicon glyphicon-remove-sign"></span>
		                        Reiniciar tabla
		                      </button>                  
		                  </div>                           
		                
		
		                <div class="col-md-12 clearfix">
		                  <table class="table" cellpadding="0" cellspacing="0">
		                    <thead>
		                      <tr>
		                        <th width="3%">#</th>
		                        <th width="33%">Descripci&oacute;n</th>
		                        <th width="10%">Moneda</th>
		                        <th width="20%">Precio unitario</th>
		                        <th width="20%">Total</th>
		                        <th width="10%">Acciones</th>
		                      </tr>
		                    </thead>
		                    <tbody class="table-fc-body">
		                    
								<@ row_number = 1 @>	                   
		
		                    </tbody>
		                  	</table>
							<!-- resultado -->
							<table class="table" cellpadding="0" cellspacing="0">
								<tbody>
		                      		<tr>
		                      			<td colspan="3" width="48%">&nbsp;</td>
		                        		<td width="21%"><strong>Sub total</strong></td>
		                        		<td class="label-sub-total">00.000</td>
		                        		<td>&nbsp;</td>
		                     		 </tr>
		                      		<tr>
		                        		<td colspan="3">&nbsp;</td>
		                        		<td><strong>IVA [21%]</strong></td>
		                        		<td class="label-iva">00.000</td>
		                        		<td>&nbsp;</td>
		                      		</tr>
		                      		<tr>
		                       			<td colspan="3">&nbsp;</td>
		                        		<td><strong>Total</strong></td>
		                        		<td class="label-total">00.000</td>
		                        		<td>&nbsp;</td>
		                      		</tr>
								</tbody>
							</table>
		                </div>

                      <div class="col-md-12 clearfix">
                        <hr>
                      </div>
                      <div class="col-md-12 clearfix">
                        <button type="button" class="btn btn-right btn-primary btn-accept">Aceptar</button>
                        <button type="button" class="btn btn-right btn-primary btn-cancel">Cancelar</button>
                      </div>
		
		              </div>
		
		
		            </fieldset>
		          </form>
		        </div>
		      </div>            
		  </section>              
		</div>
	</script>