# Filtro-UFIR-cuadratico
El filtro de respuesta al impulso cuadrático es otro tipo de filtro FIR (Finite Impulse Response) que se caracteriza por tener una respuesta en frecuencia que sigue una forma cuadrática (l = 2). Su respuesta al impulso se asemeja a una función cuadrática, lo que significa que su salida aumenta con una curva cuadrática en función del tiempo de la señal de entrada.

El funcionamiento del filtro cuadrático es similar al del filtro de rampa, pero en este caso, la respuesta en frecuencia sigue una forma cuadrática en lugar de lineal. Al convolucionar la señal de entrada con la respuesta al impulso cuadrática, se obtiene la señal de salida filtrada, que presenta una respuesta en frecuencia cuadrática.

El presente código es una implementación del filtro cuadrático en VHDL. Según lo propuesto por el artículo "Implementation of Digital Unbiased FIR Filters with Polynomial Impulse Responses" del Dr. Shmaliy, el filtro cuadrático requiere 9 multiplicadores, 5 sumadores y 4 retardos temporales para su implementación. Esto se debe a la complejidad adicional asociada con la forma cuadrática de la respuesta al impulso. Para facilitar el diseño, se utilizó Simulink, donde se crearon los bloques para su respectiva simulación y para la creación del código en VHDL se utilizó el Code Generator de Simulink. El código en VHDL se sintetizó en el software ISE Design Suite 14.7.

Si se desea más información sobre el filtro, puede consultarse en el siguiente enlace:
https://ieeexplore.ieee.org/document/7096314
