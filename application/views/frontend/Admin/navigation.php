<!-- Sidebar -->
<?php $account_type   = $this->session->userdata('login_type'); ?>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	<div class="sb-sidenav-menu">
		<div class="nav">
			<div class="sb-sidenav-menu-heading">Business</div>
			<a class="nav-link <?=($page_name == 'dashboard') ? 'active': '' ?>" href="<?php echo base_url(); ?>admin/dashboard">
				<div class="sb-nav-link-icon">
					<i class="fa fa-desktop"></i>
				</div>
				<span><?php echo 'Dashboard'; ?></span>
			</a>
			<a class="nav-link collapsed <?=($page_name == 'supplier') || ($page_name == 'vendor')  ? 'active': '' ?>" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
				<div class="sb-nav-link-icon">
					<i class="fa fa-money"></i>
				</div>
				<span><?php echo 'Merchants'; ?></span>
				<div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
			</a>
			<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav">
					<a class="nav-link <?=($page_name == 'vendor') ? 'active': '' ?>" href="<?php echo base_url(); ?>admin/vendor"><span><?php echo 'vendor'; ?></span></a>
					<a class="nav-link <?=($page_name == 'supplier') ? 'active': '' ?>" href="<?php echo base_url(); ?>admin/supplier"><span><?php echo 'supplier'; ?></span></a>
				</nav>
			</div>
			<a class="nav-link <?=($page_name == 'product') || ($page_name == 'category') ? 'active' : '' ?> collapsed" href="#" data-toggle="collapse" data-target="#products" aria-expanded="false" aria-controls="collapseLayouts">
				<div class="sb-nav-link-icon">
					<i class="fa fa-tasks"></i>
				</div>
				<span><?php echo 'Products'; ?></span>
				<div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
			</a>
			<div class="collapse" id="products" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav">
					<a class="nav-link <?=($page_name == 'category') ? 'active' : '' ?>" href="<?php echo base_url(); ?>admin/category"><span><?php echo 'category'; ?></span></a>
					<a class="nav-link <?=($page_name == 'product') ? 'active' : '' ?>" href="<?php echo base_url(); ?>admin/product"><span><?php echo 'products'; ?></span></a>
				</nav>
			</div>
			
			<a class="nav-link <?=($page_name == 'icecream/create_sales') || ($page_name == 'stationary/create_sales') || ($page_name == 'icecream/ice_cream_sales_list') || ($page_name == 'stationary/stationary_sales_list') || ($page_name == 'icecream/items') || ($page_name == 'stationary/items') ? 'active': ''; ?> collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
				<div class="sb-nav-link-icon"><i class="fa fa-book"></i></div>
				<?php echo 'Sales Record'; ?>
				<div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
			</a>
			<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
					<a class="nav-link <?=($page_name == 'Medicine/ice_cream_sales_list') || ($page_name == 'Medicine/items') || ($page_name == 'Medicine/update_sales') || ($page_name == 'Medicine/create_sales') ? 'active': ''; ?> collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
						Medicine
						<div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>
					</a>
					<div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link <?=($page_name == 'icecream/ice_cream_sales_list') ? 'active': ''; ?>" href="<?php echo base_url(); ?>admin/ice_cream">Order Invoices</a>
							<a class="nav-link <?=($page_name == 'icecream/items') ? 'active': ''; ?>" href="<?php echo base_url(); ?>admin/ice_cream_items">Items Sold</a>
						</nav>
					</div>
					<a class="nav-link <?=($page_name == 'stationary/stationary_sales_list') || ($page_name == 'stationary/items') || ($page_name == 'stationary/update_sales') || ($page_name == 'stationary/create_sales')  ? 'active': ''; ?> collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
						<!-- Medical Equipment -->
						<!--	<div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down"></i></div>-->
					</a>
					<div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link <?=($page_name == 'stationary/stationary_sales_list') ? 'active': ''; ?>" href="<?php echo base_url(); ?>admin/stationary">Order</a>
							<a class="nav-link <?=($page_name == 'stationary/items') ? 'active': ''; ?>" href="<?php echo base_url(); ?>admin/stationary_items">Items</a>
						</nav>
					</div>
				</nav>
			</div>
			<div class="sb-sidenav-menu-heading">Personnel</div>
			<a class="nav-link <?php if ($page_name == 'manage_profile') echo 'active'; ?>" href="<?php echo base_url(); ?>admin/profile">
				<div class="sb-nav-link-icon"><i class="fa fa-user"></i></div>
				Profile
			</a>
			<div class="sb-sidenav-menu-heading">Config</div>
			<a class="nav-link <?php if ($page_name == 'sys_settings') echo 'active'; ?>" href="<?php echo base_url(); ?>admin/settings">
				<div class="sb-nav-link-icon"><i class="fa fa-gears"></i></div>
				Settings
			</a>
		</div>
	</div>
	<div class="sb-sidenav-footer">
		<div class="small">Logged in as:</div>
		<?=$account_type ?>	
	</div>
</nav>

