extends Node
#### "gestos de proyectos es la variable que contiene 
#### la lista (Array) de los datos.
#delaro gestor_de_proyectos como lista
onready var gestor_de_proyectos =[]

#delaro salida_texto y  le asignno un nodo tipo label, 
# por donde saldrá la información por pantalla
onready var salida_texto = get_node("Label")

# declaro direccion y le asigno un strin con la direccion
# contine la direccion donde se guardará 
# el archivo físico con la base de datos
var direccion = "res://data.json"

# delaro 
onready var entrada_texto 
func _ready():
	cargar()
	set_fixed_process(false)

func _fixed_process():
	pass

# funciones de archivo
func salvar():
	# asigno el valor del nodo entrada de teclado
	entrada_texto = get_node("TextEdit").get_text()
	# a la lista gestor_de_proyectos 
	#le añado al finan  el valor entrada_texto
	
	gestor_de_proyectos.append(entrada_texto + "\n")
	print("guardo archivo")
	print(entrada_texto)
	print(entrada_texto)
	### apendiza a la lista "gestor de proyectos" 
	### el texto introducido en la "entrada_texto".
	
	##### la variable "dic" es el diccionario que contiene todos los datos
	##### he añadido un dicci
	
	#declaro dic, diccionario que se guardará en un archivo
	#en el dicccionario dic defino una key "gestor"
	# asigno el valor de "gestor_de_proyectos" a la key gestor
	var dic = {"gestor":gestor_de_proyectos }
	#declaro salvar, diccionario que se guardará en un archivo
	#en el dicccionario "salvar" defino una key ""diccionario""
	# asigno el valor de "dic " a la key "diccionario"
	var salvar = {"diccionario"  : dic }
	
	#declaro file 
	#creo un archivo "físico" es unodo tipo file
	#asigno el archivo a la variable file
	var file = File.new() 
	
	# abro archivo file , 
	#en la direccion del strim direccion
	# y lo preparo pa escribir
	file.open(direccion, file.WRITE)
	
	#almaceno en file (archivo) el valor 
	# strim que hay en salvar en formato json
	file.store_line(salvar.to_json())
	#cierro archivo
	file.close()
	
func cargar(): # cagar, :) :)
	#declaro file 
	#creo un archivo "físico" es unodo tipo file
	#asigno el archivo a la variable file
	var file = File.new()
	
	# uso el metodo "file_exits"
	# me da true si existe archivo en la direcc
	# especificadada en el strim  de la var direccion
	if not file.file_exists(direccion):
		return
		
	# abro archivo file , 
	#en la direccion del strim direccion
	# y lo preparo pa leer
	file.open(direccion, File.READ)
	
	# declaro data como un diccionario vacio
	var data = {}
	#cargo en el diccionario data el str  
	#que leo en la var file (tipo archivo) como str
	data.parse_json(file.get_as_text())
	file.close()
	
	# asigno a gestor_de_proyectos (tipo lista)
	# el valor  que hay en el diccionario data, en
	# la key diccionario, que es un diccionario y leo la key
	# .gestor (tipo lista)
	gestor_de_proyectos = data.diccionario.gestor
	
	#actualizo nodo salida tex con el strim de la lista gestor de ...
	salida_texto.set_text(str(gestor_de_proyectos))

#### Funciones de botón: presiono el boton	
func _on_salvar_boton_pressed():
	salvar()
	cargar()
#	entrada_texto = "empty"
	limpiar_texto_inter()
	

func _on_Button_pressed():
#	print("hola")
	# creo un directorio "carpeta" 
	#y se lo asigno a una variable "dir"
	var dir = Directory.new()
	#por aqui comentando
	dir.open("res://")
	dir.make_dir("hola")

# funciones de interface
func limpiar_texto_inter():
	# "borro" nodo entrada texto  poniendo lo a 0
	get_node("TextEdit").set_text("")
	print("limpiado texto entrada")
