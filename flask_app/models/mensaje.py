from flask_app.config.mysqlconnection import connectToMySQL

class Mensaje:
    def __init__(self,data):
        self.id = data['id']
        self.mensaje = data['mensaje']
        self.enviado_id = data['enviado_id']
        self.recibido_id = data['recibido_id']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']

    @classmethod
    def destroy(cls,data):
        query  = "DELETE FROM mensajes WHERE mensajes.id = %(id)s;"
        return connectToMySQL('esquema_muro').query_db(query,data)

    @classmethod
    def obtener_mensaje(cls,data):
        #query para llamar usuario remitente, receptor, y mensajes.
        query = "SELECT usuarios.nombre AS enviado, amigo.nombre AS recibido, mensajes.* FROM usuarios LEFT JOIN mensajes ON usuarios.id = mensajes.enviado_id LEFT JOIN usuarios AS amigo ON amigo.id = mensajes.recibido_id WHERE amigo.id =  %(id)s"
        results = connectToMySQL('esquema_muro').query_db(query,data)
        print(results)
        mensajes = []
        for mensaje in results:
            mensajes.append( cls(mensaje) )
        return mensajes

    @classmethod
    def guardar_mensaje(cls,data):
        query = "INSERT INTO mensajes (mensaje, enviado_id, recibido_id) VALUES (%(mensaje)s,%(enviado_id)s,%(recibido_id)s);"
        print(query)
        return connectToMySQL('esquema_muro').query_db(query,data)
        