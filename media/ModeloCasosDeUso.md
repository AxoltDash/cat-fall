# Modelo de Casos de Uso (UML)

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
   - El temporizador (`Timer`) emite la señal `timeout`.
   - El método `_on_timer_timeout` es llamado.

2. **Decisión de Tipo de Enemigo:**
   - Se genera un número aleatorio.
   - Si el número es menor que 0.6, se selecciona `enemy`.
   - Si el número es mayor o igual a 0.6, se selecciona `enemyRoll`.

3. **Instanciación del Enemigo:**
   - Se instancia el enemigo seleccionado (`enemy` o `enemyRoll`).
   - Se establece la posición global del enemigo en la posición del nodo `PathFollow2D`.

4. **Configuración del Enemigo:**
   - Para `enemy`:
     - Se establece una rotación aleatoria entre -359 y 359 grados.
     - Se establece una velocidad de rotación aleatoria entre 0.5 y 2.0.
   - Para `enemyRoll`:
     - Se establece una rotación aleatoria entre -10 y 10 grados.

5. **Agregar Enemigo al Nivel:**
   - El enemigo instanciado se agrega como hijo del nodo `Level`.

6. **Reiniciar Temporizador:**
   - Se calcula un nuevo tiempo de espera basado en el tiempo transcurrido (`elapsed_time`).
   - Se establece el nuevo tiempo de espera en el temporizador (`Timer`).
   - Se reinicia el temporizador.

**Flujos Alternativos:**
- **Error en la Instanciación:**
  - Si ocurre un error al instanciar el enemigo, se maneja la excepción y se registra el error.

# Diagrama de Secuencia ("segun mi esquizo, solo falta plasmarlo")
---
1. **Timer** -> **Level**: `timeout` (señal)
2. **Level** -> **_on_timer_timeout**: Llamada al método
3. **_on_timer_timeout**: Generar número aleatorio
4. **_on_timer_timeout**: Decidir tipo de enemigo (`enemy` o `enemyRoll`)
5. **_on_timer_timeout** -> **enemy/ enemyRoll**: Instanciar enemigo
6. **_on_timer_timeout**: Configurar posición y rotación del enemigo
7. **_on_timer_timeout** -> **Level**: Agregar enemigo como hijo
8. **_on_timer_timeout**: Calcular nuevo tiempo de espera
9. **_on_timer_timeout** -> **Timer**: Establecer nuevo tiempo de espera y reiniciar