from flask import Flask, jsonify, request
from base_de_datos import db, Equipo, Jugador, Liga
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
port = 5000

#Configuracion base de datos

app.config['SQLALCHEMY_DATABASE_URI']= 'postgresql+psycopg2://postgres:postgres@localhost:5432/ligas'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False

#Endpoints

#Ruta mostrar ligas

@app.route('/', methods=['GET'])
def mostrar_ligas():
    try:
        ligas = Liga.query.all()
        ligas_datos = []
        for liga in ligas:
            liga_datos = {
                'id': liga.id,
                'nombre': liga.nombre,
                'pais_origen': liga.pais_origen
            }
            ligas_datos.append(liga_datos)
        return jsonify(ligas_datos)

    except Exception as error:
        print('Error-1', error)
        return jsonify({'mensaje': 'Error de Conexion'}), 500
    
#Ruta mostrar equipos de liga

@app.route('/equipo/<int:liga_id>', methods=['GET'])
def mostrar_equipos(liga_id):
    try:
        equipos = Equipo.query.where(Equipo.liga_id == liga_id).all()
        equipos_datos = []
        for equipo in equipos:
            equipo_datos = {
                'id': equipo.id,
                'nombre': equipo.nombre,
                'dt': equipo.dt,
                'descripcion': equipo.descripcion
            }
            equipos_datos.append(equipo_datos)
        return jsonify(equipos_datos)

    except Exception as error:
        print('Error-2', error)
        return jsonify({'mensaje': 'Error de Conexion'}), 500
    
#Ruta mostrar jugadores de equipo

@app.route('/equipo/jugador/<int:equipo_id>', methods=['GET'])
def mostrar_jugadores(equipo_id):
    try:
        jugadores = Jugador.query.where(Jugador.equipo_id == equipo_id).all()
        jugadores_datos = []
        for jugador in jugadores:
            jugador_datos = {
                'id': jugador.id,
                'nombre': jugador.nombre,
                'edad': jugador.edad,
                'posicion': jugador.posicion,
                'nacionalidad': jugador.nacionalidad,
                'titularidad': jugador.titularidad,
                'camiseta': jugador.camiseta,
                'capitan': jugador.capitan
            }
            jugadores_datos.append(jugador_datos)
        return jsonify(jugadores_datos)

    except Exception as error:
        print('Error-3', error)
        return jsonify({'mensaje': 'Error de Conexion'}), 500

#Ruta agregar jugadores al equipo

@app.route('/equipo/jugador/crear_jugador/<int:equipo_id>', methods=["POST"])
def crear_jugador(equipo_id):
    try:
        data = request.json

        nuevo_nombre = data.get('nombre')
        nuevo_edad = data.get('edad')
        nuevo_posicion = data.get('posicion')
        nuevo_camiseta = data.get('camiseta')
        nuevo_nacionalidad = data.get('nacionalidad')
        nuevo_titularidad = data.get('titularidad') == 'true'
        nuevo_capitan = data.get('capitan') == 'true'

        jugador_capitan = Jugador.query.where(Jugador.equipo_id == equipo_id, Jugador.capitan == "true").first()
        jugador_titular = Jugador.query.where(Jugador.equipo_id == equipo_id, Jugador.titularidad == "true").count()
        jugador_suplente = Jugador.query.where(Jugador.equipo_id == equipo_id, Jugador.titularidad == "false").count()
        
        if nuevo_titularidad and nuevo_capitan:
            if jugador_capitan:
                return jsonify({'error': 'Ya existe un capitan'}), 500
            elif jugador_titular >= 11:
                return jsonify({'error': 'Ya existen 11 titulares'}), 500
            else:
                nuevo_jugador = Jugador(
                    nombre = nuevo_nombre,
                    edad = nuevo_edad,
                    posicion = nuevo_posicion,
                    camiseta = nuevo_camiseta,
                    nacionalidad = nuevo_nacionalidad,
                    titularidad = nuevo_titularidad,
                    capitan = nuevo_capitan,
                    equipo_id = equipo_id
                )
        elif nuevo_titularidad and not nuevo_capitan:
                if jugador_titular >= 11:
                    return jsonify({'error': 'Ya existen 11 titulares'}), 500
                else:
                    nuevo_jugador = Jugador(
                        nombre = nuevo_nombre,
                        edad = nuevo_edad,
                        posicion = nuevo_posicion,
                        camiseta = nuevo_camiseta,
                        nacionalidad = nuevo_nacionalidad,
                        titularidad = nuevo_titularidad,
                        capitan = nuevo_capitan,
                        equipo_id = equipo_id
                    )
        elif not nuevo_titularidad and nuevo_capitan:
            return jsonify({'error': 'Un suplente no puede ser capitan'}), 500
        else:
            if jugador_suplente >= 11:
                return jsonify({'error': 'Ya existen 11 suplentes'}), 500
            else:
                nuevo_jugador = Jugador(
                    nombre = nuevo_nombre,
                    edad = nuevo_edad,
                    posicion = nuevo_posicion,
                    camiseta = nuevo_camiseta,
                    nacionalidad = nuevo_nacionalidad,
                    titularidad = nuevo_titularidad,
                    capitan = nuevo_capitan,
                    equipo_id = equipo_id
                )
        
        db.session.add(nuevo_jugador)
        db.session.commit()    

        return ({'mensaje':{'id': nuevo_jugador.id,
                            'nombre': nuevo_jugador.nombre,
                            'edad': nuevo_jugador.edad,
                            'posicion': nuevo_jugador.posicion,
                            'camiseta': nuevo_jugador.camiseta, 
                            'nacionalidad': nuevo_jugador.nacionalidad,
                            'titular': nuevo_jugador.titularidad,
                            'capitan': nuevo_jugador.capitan,
                            'equipo_id': equipo_id}}), 201    
    except Exception as error:
        print('Error-4', error)
        return jsonify({'error': 'Error al agregar jugador'}), 500

#Ruta eliminar jugadores del equipo

@app.route('/equipo/jugador/<int:id>', methods=["DELETE"])
def eliminar_jugador(id):
    try:
        jugador = Jugador.query.get(id)
        if not jugador:
            return jsonify({"error": "Jugador no encontrado"}), 404

        db.session.delete(jugador)
        db.session.commit()

        return jsonify({"success": True, 'id': id}), 200
    except Exception as error:
        print('Error-6', error)
        return jsonify({"error": "Error al eliminar jugador"}), 500
    
#Ruta modificar jugadores del equipo

@app.route('/equipo/jugador/editar_jugador/<int:jugador_id>', methods=['PUT'])
def modificar_jugador(jugador_id):
    try:
        data = request.json
        
        jugador = Jugador.query.get(jugador_id)

        if not jugador:
            return jsonify({"Error": "Jugador no encontrado"}), 404

        campos_actualizables = ['nombre', 'edad', 'posicion', 'camiseta', 'nacionalidad', 'titular', 'capitan']

        for campo in campos_actualizables:
            if campo in data and data[campo]:
                valor = data[campo].strip()
                if valor:
                    if campo == 'nombre':
                        jugador.nombre = valor
                    if campo == 'edad':
                        jugador.edad = valor    
                    if campo == 'posicion':
                        jugador.posicion = valor
                    if campo == 'camiseta':
                        jugador.camiseta = valor
                    if campo == 'nacionalidad':
                        jugador.nacionalidad = valor
                    if campo == 'titular':
                        jugador.titularidad = valor
                    if campo == 'capitan':
                        jugador.capitan = valor

        db.session.commit()

        return ({'mensaje':{'id': jugador.id, 'equipo_id': jugador.equipo_id}}), 201

    except Exception as error:
        print('Error-5', error)
        return jsonify({"error": "Error al modificar jugador"}), 500


#Creamos las tablas en la base de datos

if __name__ == '__main__':
    db.init_app(app)
    with app.app_context():
        db.create_all()
    app.run(host='0.0.0.0', debug=True, port=port)