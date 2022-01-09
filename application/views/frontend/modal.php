<script type="text/javascript">
	function showAjaxModal(url)
	{
		// SHOWING AJAX PRELOADER IMAGE
		$('#modal_ajax .modal-body').html('<div style="text-align:center; margin-top:200px;"><img src="<?=base_url(); ?>assets/img/preloader.gif" style="height:25px;" /></div>');
		
		$('#modal_ajax').modal('show', {backdrop: 'true'});

		// SHOW AJAX RESPONSE ON REQUEST SUCCESS
		$.ajax({
			url: url,
			method: 'POST',
			success: function(response)
			{
				$('#modal_ajax .modal-body').html(response);
			}
		});
	}

</script>

    <!-- (Ajax Modal)-->
    <div class="modal fade" id="modal_ajax" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLabel"></h4>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
                </div>
                <div class="modal-body">
				
                </div>
				<div class="modal-footer">
					Strathmore University Medical Center
				</div>
            </div>
        </div>
    </div>
	

