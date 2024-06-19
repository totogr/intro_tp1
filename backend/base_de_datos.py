from flask_sqlalchemy import SQLAlchemy

#Instancia para interactuar con la base de datos

db = SQLAlchemy()

#Creamos tabla Liga

class Liga(db.Model):
    __tablename__ = 'liga'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String(255), nullable=False)
    equipos = db.relationship('Equipo', backref='liga', lazy=True)
    pais_origen = db.Column(db.String(255), nullable=False)

#Creamos tabla Equipo

class Equipo(db.Model):
    __tablename__ = 'equipo'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String(255), nullable=False)
    dt = db.Column(db.String(255), nullable=False)
    descripcion = db.Column(db.String(255))
    jugadores = db.relationship('Jugador', backref='equipo', lazy=True)
    liga_id = db.Column(db.Integer, db.ForeignKey('liga.id'), nullable=False)

#Creamos tabla Jugador

class Jugador(db.Model):
    __tablename__ = 'jugador'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String(255), nullable=False)
    edad = db.Column(db.Integer, nullable=False)
    posicion = db.Column(db.String(255), nullable=False)
    nacionalidad = db.Column(db.String(255), nullable=False)
    titularidad = db.Column(db.Boolean, nullable=False)
    camiseta = db.Column(db.Integer, nullable=False)
    capitan = db.Column(db.Boolean, nullable=False)
    equipo_id = db.Column(db.Integer, db.ForeignKey('equipo.id'), nullable=False)