from flask import redirect, request, session
from flask_app import app
from flask_app.models.mensaje import Mensaje
#from flask_app.controllers.usuarios import usuarios


#ruta para eliminar los mensajes enviados por otros usuarios
@app.route('/borrar/mensaje/<int:id>')
def borrar_mensaje(id):
    
    data ={ 
        "id":id
    }
    Mensaje.destroy(data)
    return redirect('/muro')

@app.route('/enviarmensaje', methods=['POST'])
def mandar_mensaje():
    #si el usuario no está logeado, redirigir a la pantalla de inicio
    if 'user_id' not in session:
        return redirect('/')

    data = {
        "mensaje": request.form['mensaje'],
        "enviado_id":  request.form['enviado_id'],
        "recibido_id" : request.form['recibido_id']
    }

    Mensaje.guardar_mensaje(data)
    return redirect('/muro')