#MATRIZ A
#  1.0000   2.0000   3.0000
# 2.0000   4.0001   6.0000
#  3.0000   6.0000   9.0001
#MATRIZ B
#  1
#  2
#  3
#Este sistema está mal condicionado porque las filas de la matriz A son casi linealmente dependientes. 
#Si los coeficientes fueran exactos (como 2, 4, 6, y 9), las filas serían completamente dependientes, 
#haciendo que la matriz sea singular (no invertible). En este caso, pequeñas perturbaciones en los valores, 
#como 4.0001 y 9.0001, hacen que el sistema sea sensible a cambios en los coeficientes o en el vector b.
a = [1 2 3; 2 4.0001 6; 3 6 9.0001]
b = [1; 2; 3]
disp('descomposicion lu')
[L, U] = lu(a)

% Resolución del sistema
y = L \ b
disp('solucion del sistema')
x = inv(a)*b

% Cálculo del determinante y el número de condición
disp('determinante A')
det_a = det(a)
disp('condicional A')
cond_a = cond(a)

% Definir las funciones de las proyecciones en el plano XY
f1 = @(x1, x2) -(a(1,1)*x1 + a(1,2)*x2 - b(1))/a(1,3);
f2 = @(x1, x2) -(a(2,1)*x1 + a(2,2)*x2 - b(2))/a(2,3);
f3 = @(x1, x2) -(a(3,1)*x1 + a(3,2)*x2 - b(3))/a(3,3);

% Graficar las funciones en el plano XY
figure;
hold on;
fplot(@(x) f1(x, 0), [-5, 5]);  % Proyección de la primera ecuación
fplot(@(x) f2(x, 0), [-5, 5]);  % Proyección de la segunda ecuación
fplot(@(x) f3(x, 0), [-5, 5]);  % Proyección de la tercera ecuación
xlabel('x');
ylabel('y');
title('Proyeccion en el plano XY');
legend('Ecuacionn 1', 'Ecuacion 2', 'Ecuacion 3');
hold off;

% Imprimir los resultados
disp('Solucion del sistema:')
disp(x);
disp('Determinante de A:')
disp(det_a);
disp('Condicion de A:')
disp(cond_a);
