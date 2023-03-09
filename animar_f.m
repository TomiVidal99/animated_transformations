% Animaciones para visualizar las transformaciones a una funcion

function [transformada] = animar_f(t, f, a, b)
  % Parámetros:
  % - 't' vector tiempo
  % - 'f' funcion sin transformar
  % - 'a' coeficiente de expansion
  % - 'b' coeficiente de desplazamiento
  % Retorno:
  % - 'transformada' funcion 'f' transformada

  transformada = NaN;

  % TODO: hacer la animacion

  transformada = f(a .* (t - b/a) );

end
