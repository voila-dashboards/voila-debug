window.debug_init = async (voila) => {
  const kernel = await voila.connectKernel();
  kernel.statusChanged.connect((sender, status) => {
    switch (status) {
      case "idle":
        $("#kernel-activity").removeClass("jp-FilledCircleIcon").addClass("jp-CircleIcon");
        $("#kernel-indicator").fadeOut(500);
        break;
      case "busy":
        $("#kernel-activity").removeClass("jp-CircleIcon").addClass("jp-FilledCircleIcon");
        $("#kernel-indicator").fadeOut(500);
        break;
      case "restarting":
        $("#kernel-indicator").addClass("jp-mod-warn");
        $("#kernel-indicator-label").text("Restarting");
        $("#kernel-indicator").show();
        break;
      case "connected":
        $("#kernel-indicator").removeClass("jp-mod-warn");
        $("#kernel-indicator-label").text("Connected");
        $("#kernel-indicator").show();
        break;
    }
  });
};
