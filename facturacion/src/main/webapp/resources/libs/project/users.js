

// Model
window.User = Backbone.Model.extend({
	urlRoot: "personas",
	defaults: {
		"id"		: null,
	    "nombre"	: "",
	    "apellido"	: "",
	    "mail"		: "",
	    "telefono"	: "",
	    "username"	: "",
	    "password"	: "",
	    "rol"		: {
	    	"id"	: ""
	    },
	    "enabled"	: ""
	  }
});

window.DeleteModel = new Backbone.Model({ 
	title		: '', 
	body		: '',
	modal_id	: 'modal'
});

window.AlertModel = new Backbone.Model({ 
	'type'		: '', 
	'body'		: ''
});


window.UserCollection = Backbone.Collection.extend({
	url: "personas"
});


/*
 * 	Vision total de usuarios
 * */

window.UsersView = Backbone.View.extend({

	el: PATH_LAYOUT,
	
	active:".btn-usuarios",

	template: _.template( $('#tmpl-list-user').html() ),

	events: {
		'click .btn-add'		: 'user_add',
		'click .btn-delete'		: 'user_delete',
		'click .btn-edit'		: 'user_edit',
		'click .btn-password'	: 'user_password'
	},

	initialize: function () {

		this.model.fetch();
		this.model.bind('change', this.render, this); 

	}, 

	render: function () {
		
		active(this.active);
		
	    $(this.el).html(this.template(this.model.toJSON()));
	    return this;

	},
	
	user_add: function(ev){
		
		app.navigate(URL_USER_ADD, true);
		
	},
	
	user_edit: function(ev){
		
		var id = $(ev.currentTarget).attr('data');
		
		app.navigate(URL_USER_EDIT + id, true);
		
	},
	
	user_password: function(ev){
		
    	var msg = AlertModel.set({
    		'type': 'error',
    		'body': 'Acceso no disponible por el momento'
    	});
    	
    	new AlertView({model: msg }); 		
		
	},

	user_delete: function(ev){

		var id = $(ev.currentTarget).attr('data');
		var usuario = $(ev.currentTarget).attr('data-usuario');

		var msg = DeleteModel.set({
			'title'	: 'Eliminar Usuario', 
			'body'  : '�Confirma la eliminaci&oacute;n de '+ usuario +'?',
			'id'	: id
		});

		var view = new DeleteUserView({ model: msg });
		view.show();

	}     
});

/*
 * 	Creacion de usuario
 * */

window.NewUsuerView = Backbone.View.extend({
	
	el: PATH_LAYOUT,
	
	active:".btn-usuarios",

	template: _.template( $('#tmpl-new-user').html() ),
	
    events: {
        'click .btn-accept': 'accept',
        'click .btn-cancel': 'cancel'
    },

	initialize: function () {
		
		_.bind(this.render, 'render');
		//this.model.fetch();
		//this.model.bind('change', this.render, this);
		//this.render();
	}, 

	render: function () {
		
		active(this.active);
		
	    $(this.el).html(this.template(this.model.toJSON()));
	    return this;

	},

	// Btn click Aceptar / Save usuario
    accept: function() {
    	    	
    	console.log('envio...');
    	/*
    	if( $('#frm-new-user').valid() ){
	    	this.post = new UserCollection();
	    	
	    	this.post.create({
	    		"id"			: null,
	    	    "nombre"		: $("input[name='nombre']").val(),
	    	    "apellido"		: $("input[name='apellido']").val(),
	    	    "mail"			: $("input[name='mail']").val(),
	    	    "telefono"		: $("input[name='telefono']").val(),
	    	    "username"		: $("input[name='username']").val(),
	    	    "password"		: $("input[name='password']").val(),
	    	    "rol"			: {
	    	    	"id"		: $("select[name='rol'] option:selected").val()
	    	    },
	    	    "enabled"		: parseInt( $("select[name='enabled'] option:selected").val(), 10 )
	    	} , {
				success: function(response) {
					
					var msg = AlertModel.set({
	            		'type': 'success',
	            		'body': 'El usuario se creo correctamente'
	            	});
	            	
	            	new AlertView({model: msg });
				
					app.navigate(URL_USERS, true);
					
				},
	            error : function(err, response) {
	            	
	            	var msg = AlertModel.set({
	            		'type': 'error',
	            		'body': 'Hubo un error'
	            	});
	            	
	            	new AlertView({model: msg });       
	        		
	            }
			}); 
    	}else{
  
        	var msg = AlertModel.set({
        		'type': 'error',
        		'body': 'Completa los campos requeridos'
        	});
        	
        	new AlertView({model: msg }); 
        	
    	}
    	*/
    	
    },
    
    cancel: function(){
    	
    	app.navigate(URL_USERS, true);
    	
    }

});


/*
 * 	Edicion de usuario
 * */

window.EditUserView = Backbone.View.extend({

	el: PATH_LAYOUT,
	
	active:".btn-usuarios",

	template: _.template( $('#tmpl-new-user').html() ),

	events: {
		'click .btn-accept': 'accept',
		'click .btn-cancel': 'cancel'
	},

	initialize: function () {

		this.model.fetch();
		this.model.bind('change', this.render, this); 

	}, 

	render: function () {
		
		active(this.active);
		
	    $(this.el).html(this.template(this.model.toJSON()));
	    
	    // Remove a la columna de usuario y contrase�a
	    $(this.el).find('.col-2').remove();
	    $(this.el).find('.col-1, .col-3').removeClass('col-md-4').addClass('col-md-6');
	    
	    return this;

	},

	// Btn click Aceptar / Save usuario
    accept: function() {
    	
    	var user = new UserCollection();
	    		
    	user.create({
    		"id"			: $("input[name='id']").val(),
    	    "nombre"		: $("input[name='nombre']").val(),
    	    "apellido"		: $("input[name='apellido']").val(),
    	    "mail"			: $("input[name='mail']").val(),
    	    "telefono"		: $("input[name='telefono']").val(),
    	    "username"		: $("input[name='username']").val(),
    	    "password"		: $("input[name='password']").val(),
    	    "rol"			: {
    	    	"id"		: $("select[name='rol'] option:selected").val()
    	    },
    	    "enabled"		: parseInt( $("select[name='enabled'] option:selected").val(), 10 )
    	} , {
			success: function() {
				
				app.navigate(URL_USERS, true);
				
			},
            error : function(err) {
            }
		}); 	
    	
    },
    
    cancel: function(){
    	
    	app.navigate(URL_USERS, true);
    	
    }		
	
});


window.AlertView = Backbone.View.extend({
	
	el: PATH_ALERT,	
	
	template: _.template('<p class="<@= type @>"><@= body @></p>'),
	
    initialize: function() {
    	
        this.render();
    
    },

    render: function() {
    	
    	$(this.el).html(this.template(this.model.toJSON())).show().delay(4000).fadeOut('fast');
	    return this; 
	    
    }   
    
});

/*
 * 	Eliminacion de usuario
 * */

window.DeleteUserView = Backbone.View.extend({

	el: PATH_MODAL,
	
    events: {
        'click .btn-aceptar': 'accept'
    },

    initialize: function() {
        this.template = _.template($('#tmpl-modal').html());
    },

    render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    },

    show: function() {
        $(document.body).append(this.render().el);
    },
    
    hide: function(){
    	$('#modal').modal('hide');
    },

    accept: function() {
    	
    	this.hide();
    	
    	var id = this.model.attributes.id;
    	
    	$('#user-' + id).remove();
    	
    	var user = new User({
    		"id":id
    	});
    	    	
    	user.destroy();	
    	    	
    }
       
});

