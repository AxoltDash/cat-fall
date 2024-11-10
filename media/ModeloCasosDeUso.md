# Modelo de Casos de Uso para el Mediador `_on_timer_timeout`

## Caso de Uso: Instanciar Enemigos

**Actor Principal:** Temporizador (`Timer`)

**Precondiciones:**
- El temporizador (`Timer`) está activo y conectado al método `_on_timer_timeout`.
- Las escenas de los enemigos (`enemy` y `enemyRoll`) están cargadas y disponibles.

**Postcondiciones:**
- Se instancia un enemigo (`enemy` o `enemyRoll`) y se agrega al nivel (`Level`).
- El temporizador se reinicia con un nuevo tiempo de espera aleatorio.

**Flujo Principal:**

1. **Evento de Timeout:**
   - El temporizador (`Timer`) emite la señal `timeout` cuando se agota el tiempo de espera.
   - Esta señal activa el método `_on_timer_timeout` en el nodo `Level`.

2. **Llamada al Método Mediador:**
   - El método `_on_timer_timeout` es llamado en respuesta a la señal `timeout`.

3. **Generación de Número Aleatorio:**
   - Dentro del método `_on_timer_timeout`, se genera un número aleatorio entre 0 y 1 usando `randf()`.

4. **Decisión de Tipo de Enemigo:**
   - Si el número aleatorio es menor que 0.6, se selecciona el enemigo `enemy`.
   - Si el número aleatorio es mayor o igual a 0.6, se selecciona el enemigo `enemyRoll`.

5. **Instanciación del Enemigo:**
   - Se instancia el enemigo seleccionado (`enemy` o `enemyRoll`) usando el método `instantiate()`.

6. **Configuración de la Posición del Enemigo:**
   - La posición global del enemigo instanciado se establece en la posición del nodo `PathFollow2D` usando `global_position`.

7. **Configuración de la Rotación del Enemigo:**
   - Para `enemy`:
     - Se establece una rotación aleatoria entre -359 y 359 grados usando `randf_range(deg_to_rad(-359), deg_to_rad(359))`.
     - Se establece una velocidad de rotación aleatoria entre 0.5 y 2.0 usando `randf_range(0.5, 2.0)`.
   - Para `enemyRoll`:
     - Se establece una rotación aleatoria entre -10 y 10 grados usando `randf_range(deg_to_rad(-10), deg_to_rad(10))`.

8. **Agregar Enemigo al Nivel:**
   - El enemigo instanciado se agrega como hijo del nodo `Level` usando `add_child(enemy_instance)`.

9. **Reiniciar Temporizador:**
   - Se calcula un nuevo tiempo de espera basado en el tiempo transcurrido (`elapsed_time`).
   - El nuevo tiempo de espera se establece en el temporizador (`Timer`) usando `timer.wait_time`.
   - El temporizador se reinicia usando `timer.start()`.

**Flujos Alternativos:**
- **Error en la Instanciación:**
  - Si ocurre un error al instanciar el enemigo, se maneja la excepción y se registra el error.

## Diagrama de Secuencia (Escrito):

1. **Timer** emite la señal `timeout`.
2. **Level** recibe la señal y llama al método `_on_timer_timeout`.
3. **_on_timer_timeout** genera un número aleatorio.
4. **_on_timer_timeout** decide el tipo de enemigo (`enemy` o `enemyRoll`) basado en el número aleatorio.
5. **_on_timer_timeout** instancia el enemigo seleccionado.
6. **_on_timer_timeout** configura la posición y rotación del enemigo.
7. **_on_timer_timeout** agrega el enemigo como hijo del nodo `Level`.
8. **_on_timer_timeout** calcula un nuevo tiempo de espera.
9. **_on_timer_timeout** establece el nuevo tiempo de espera en el temporizador.
10. **_on_timer_timeout** reinicia el temporizador.

Este modelo describe cómo el método `_on_timer_timeout` actúa como mediador para instanciar y configurar enemigos en el nivel, utilizando un temporizador para controlar el tiempo entre las instancias.