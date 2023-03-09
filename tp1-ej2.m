close all; clear h;
graphics_toolkit qt;

%t0 = [-5:1e-2:5];
%f0 = @(t) caj(t);
%a0 = 1;
%b0 = 2;

function handleDrawLoop(h, t, f, a, b)
  % Todo esto sera ejecutado cuando el callback accione

  tf = animar_f(t, f, a, b);

  hold off;
  plot(t, f(t), "r;f(t);");
  hold on;
  plot(t, tf, "b;tf(t);");

  %configPlot(
  %  "title", "Animation test"
  %  "xstep", 1
  %);

end

function update_plot (obj, init = false)
  t0 = [-5:1e-2:5];
  f0 = @(t) caj(t);
  a0 = 1;
  b0 = 2;

  ## gcbo holds the handle of the control
  h = guidata (obj);
  replot = false;
  recalc = false;
  switch (gcbo)
    case {h.b_slider}
      recalc = true;
    case {h.a_slider}
      recalc = true;
  endswitch

  if (recalc || init)
    a = get(h.a_slider, "value");
    b = 10*get(h.b_slider, "value");
    set (h.a_label, "string", cstrcat("a: ", num2str(a)));
    set (h.b_label, "string", cstrcat("b: ", num2str(b)));
    if (init)
      handleDrawLoop(h, t0, f0, a0, b0);
      guidata (obj, h);
    else
      handleDrawLoop(h, t0, f0, a, b);
    endif
  endif

  if (replot)
    handleDrawLoop(h, t0, f0, a, b);
  endif
  
endfunction


% parametro a
h.a_label = uicontrol(
  "style", "text",
  "units", "normalized",
  "string", "a: ",
  "horizontalalignment", "left",
  "position", [0 0 0.05 0.05]
);

h.a_slider = uicontrol(
  "style", "slider",
  "units", "normalized",
  "string", "slider",
  "callback", @update_plot,
  "value", 1,
  "position", [0.04 0 0.14 0.05] 
);

% parametro b
h.b_label = uicontrol(
  "style", "text",
  "units", "normalized",
  "string", "b: ",
  "horizontalalignment", "left",
  "position", [0 0.05 0.05 0.05]
);

h.b_slider = uicontrol(
  "style", "slider",
  "units", "normalized",
  "string", "slider",
  "callback", @update_plot,
  "value", 0,
  "position", [0.04 0.05 0.14 0.05] 
);

set(gcf, "color", get(0, "defaultuicontrolbackgroundcolor"))
guidata (gcf, h)
update_plot (gcf, true);
