window.debug_init = async (voila) => {
  const kernel = await voila.connectKernel();
  kernel.statusChanged.connect((sender, status) => {
      $("#kernel-status").text(status)
  });
};
