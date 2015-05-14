$("#authModal").on("show.bs.modal", function(event){
	var button=$(event.relatedTarget);
	var mountpoint=button.data("mountpoint");
	var modal=$(this);
	modal.find("code.auth-mountpoint-name").text(mountpoint);
	modal.find("input.auth-mountpoint-name").val(mountpoint);
})

$(function () {
  $('abbr').tooltip()
})