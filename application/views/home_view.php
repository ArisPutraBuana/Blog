<!DOCTYPE html>
<html lang="en">
	<head>

		<!-- Page Title -->
		<title><?php echo $site_title;?></title>
		
		<!-- Page header -->
		<meta charset="utf-8"/>	
		<meta name="description" content=""/>
		<meta name="keywords" content=""/>
		<meta name="author" content=""/>
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
		<meta name="viewport" content="width=device-width"/>
		<!-- CSS -->
		<link rel="stylesheet" href="<?php echo base_url('theme/css/bootstrap.min.css')?>"/>
		<link rel="stylesheet" href="<?php echo base_url('theme/css/style.css')?>"/>
		<link rel="stylesheet" href="<?php echo base_url('theme/css/padding-margin.css')?>"/>
		<!-- Favicons -->		
		<link rel="shortcut icon" href="<?php echo base_url('theme/images/'.$icon);?>">
		<!-- SEO Tag -->
	    <meta name="description" content="<?php echo $site_desc;?>"/>
	    <link rel="canonical" href="<?php echo site_url();?>" />
	    <meta property="og:locale" content="id_ID" />
	    <meta property="og:type" content="website" />
	    <meta property="og:title" content="<?php echo $site_title;?>" />
	    <meta property="og:description" content="<?php echo $site_desc;?>" />
	    <meta property="og:url" content="<?php echo site_url();?>" />
	    <meta property="og:site_name" content="<?php echo $site_name;?>" />
	    <meta property="og:image" content="<?php echo base_url().'theme/images/'.$site_image?>" />
	    <meta property="og:image:secure_url" content="<?php echo base_url().'theme/images/'.$site_image?>" />
	    <meta property="og:image:width" content="560" />
	    <meta property="og:image:height" content="315" />
	    <meta name="twitter:card" content="summary" />
	    <meta name="twitter:description" content="<?php echo $site_desc;?>" />
	    <meta name="twitter:title" content="<?php echo $site_title;?>" />
	    <meta name="twitter:site" content="<?php echo $site_twitter;?>" />
	    <meta name="twitter:image" content="<?php echo base_url().'theme/images/'.$site_image?>" />
	    <link rel="stylesheet" href="<?php echo base_url().'theme/css/font-awesome.min.css'?>"/>
		<!-- End SEO Tag. -->
	</head>
	<body class="content-animate">

		<!-- PRELOADER
		==================================================-->
		<div class="page-loader">
			<div class="loader-area"></div>
			<div class="loader font-face1">loading...	
			</div>
		</div>   
		<!-- PAGE
		==================================================-->	
		<div id="top" class="page">
			
			<!-- Navigation panel
			================================================== -->		
			<?php echo $header;?>
			<!-- End Navigation panel -->
		
			<!-- Main Content
			==================================================-->		
			<main class="cd-main-content">

				<!-- HOME SECTION
				================================================== -->
				<section id="homepage" class="home page-section parallax-2 overlay-light-alpha-10" data-background="<?php echo base_url().'theme/images/'.$bg_header;?>">		
					<div class="table-content">	
						<div class="table-center-text">
							<div class="container">		
								<h2 class="font-face1 heading1 fw700 mb-40 mb-xs-30"><?php echo $caption_1;?></h2>
								<h1 class="font-face1 heading2 fw700 mb-40 mb-xs-30"><?php echo $caption_2;?></h1>
								<div class="local-scroll">
									<a href="<?php echo site_url('about');?>" class="btn bg-black white-color">About</a>
									<span class="btn_seperator"></span>
									<a href="<?php echo site_url('blog');?>" class="btn bg-black whitre-color hidden-xs">Blog</a>
								</div>
							</div>	
						</div>
					</div>
				</section>	
				
				<!-- SECTION TESTIMONIAL
				================================================== -->
				<section id="testimonial" class="page-section black-section medium-section overlay-dark-alpha-60" data-background="<?php echo base_url().'theme/images/'.$bg_testimoni;?>">
					<div class="container relative">						
						<div class="row">
							<div class="col-sm-10 col-sm-offset-1">
								<div class="block-wraper">
									<!-- Swiper -->
									<!-- Add Pagination -->
									
									<div class="slick-container testimonial-slider">		
											<?php foreach($testimonial->result() as $test):?>
											<div class="slick-item">
												<div class="testimonial-item text-center">
													<blockquote class="testimonial-text font-face1 mb-0 fw300">
														<div class="card-avatar">
															<a href="javascript:void(0)">
																<img src="<?php echo base_url().'assets/images/'.$test->testimonial_image;?>" class="img" alt=""/>
															</a>
														</div>
														<p>
															 <?php echo $test->testimonial_content;?>
														</p>
														<footer class="testimonial-author font-face1 fw700">
															<?php echo $test->testimonial_name;?>
															<div class="testimonial-rating mt-10 mb-10">&starf; &starf; &starf; &starf; &starf;</div>
														</footer>
													</blockquote>
												</div>
											</div>
											<?php endforeach;?>
											
											
									</div>	
										
								</div>	
							</div>								
						</div>
						
					</div>					
					<div class="slider-navigation-bottom">
						<div class="testimonial-right"></div>
					</div>
					<div class="slider-navigation-top">
						<div class="testimonial-left"></div>
					</div>
				</section>
				
				<!-- SECTION BLOG
				================================================== -->
				<section id="thoughts" class="page-section big-section">	
					<div class="shadow-title shadow-gray unselectable parallax-1">Blog</div>
					<div class="container">
						<div class="row">														
							<div class="col-md-6 col-md-offset-3 mb-10 mb-sm-40 text-center">
								<h2 class="font-face1 section-heading fw800 mt-0 text-center">LATEST POSTS</h2>
							</div>							
						</div>	
						<div class="row multi-columns-row">
							<?php foreach($latest_post->result() as $row):?>
							<div class="col-sm-6 col-md-4 col-lg-4 mb-md-50 mt-10 wow fadeIn">
								<article>
									<a class="articles-card" href="<?php echo site_url('blog/'.$row->post_slug);?>" title="">
										<div class="card-wrap">
											<div class="card-image">
												<div class="article-thumbnail" data-background="<?php echo base_url().'assets/images/thumb/'.$row->post_image?>"></div>				
											</div>
											<div class="card-body text-right">
												<h2 class="heading6 lp-0 mt-0 font-face1 text-right"><?php echo $row->post_title;?></h2>
											</div>
											<div class="card-footer">
												<div class="article_author">
													<div class="portrait" data-background="<?php echo base_url().'assets/images/'.$row->user_photo;?>"></div>
													<div class="author light-text"><?php echo $row->user_name;?></div>
													<div class="date"><?php echo date('d M Y',strtotime($row->post_date));?></div>
												</div>												
											</div>
										</div>
									</a>
									<div class="like light-text"><a href="javascript:void(0)"></a> <?php echo $row->post_views;?> views</div>
								</article>
							</div>
							<?php endforeach;?>
			
							
						</div>	
						<div class="row">
							<div class="mt-100 mt-md-80 mt-sm-60">
							<div class="col-sm-6 col-sm-offset-3 text-center">						
								<a class="btn bg-black" href="<?php echo site_url('blog');?>">Selengkapnya...</a>								
							</div>						
							</div>
						</div>
					</div>	
					
				</section>
								
				<!-- SECTION SUBSCRIBE
				================================================== -->
				<section  class="page-section subscribe-section small-section">
					<div class="container">
						<div class="row">
							<div class="col-md-10 col-md-offset-1">	
								<div class="form-subscribe mb-50 mb-sm-0">
									<div class="col-sm-6 mb-sm-40">
										<h2 class="heading5 mt-0 font-face1 white-color fw700 mb-0" >Newsletter.</h2>
									</div>
									<div class="col-sm-6">										
										<form class="form-inline" action="<?php echo site_url('subscribe');?>" method="post">
											<div class="form-group">
												<input type="hidden" name="url" value="<?php echo site_url();?>" required>
												<input type="email" name="email" required placeholder="Your Email..." class="form-control">
												<button type="submit" class="btn btn-subscribe">Subscribe</button>
											</div>
										</form>										
									</div>
								</div>
								<div><?php echo $this->session->flashdata('message');?></div>									
							</div>
						</div>
					</div>
				</section>
				
				<!-- FOOTER
				================================================== -->	
				<?php echo $footer;?>
				
				</main>		
	
		</div>

		<!-- Modal Search-->
		<div class="modal fade" id="ModalSearch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000;">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-body">	
		      	<form action="<?php echo site_url('search');?>" method="GET">
		        	<div class="input-group">
		              <input type="text" name="search_query" class="form-control input-search" style="height: 40px;" placeholder="Search..." required>
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="submit" style="height: 40px;background-color: #ccc;"><span class="fa fa-search"></span></button>
				      </span>
				    </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
			
		<!-- JAVASCRIPT
		==================================================-->
		<script src="<?php echo base_url('theme/js/jquery-2.2.4.min.js')?>"></script>
		<script src="<?php echo base_url('theme/js/jquery.easing.min.js')?>"></script>
		<script src="<?php echo base_url('theme/js/bootstrap.min.js')?>"></script>
		<script src="<?php echo base_url('theme/js/waypoints.min.js')?>"></script>		
		<script src="<?php echo base_url('theme/js/jquery.scrollTo.min.js')?>"></script>
		<script src="<?php echo base_url('theme/js/jquery.localScroll.min.js')?>"></script>
		<script src="<?php echo base_url('theme/js/jquery.viewport.mini.js')?>"></script>
		<script src="<?php echo base_url('theme/js/jquery.sticky.js')?>"></script>
		<script src="<?php echo base_url('theme/js/jquery.fitvids.js')?>"></script>
		<script src="<?php echo base_url('theme/js/jquery.parallax-1.1.3.js')?>"></script>
		<script src="<?php echo base_url('theme/js/isotope.pkgd.min.js')?>"></script>
		<script src="<?php echo base_url('theme/js/imagesloaded.pkgd.min.js')?>"></script> 
		<script src="<?php echo base_url('theme/js/masonry.pkgd.min.js')?>"></script>
		<script src="<?php echo base_url('theme/js/jquery.magnific-popup.min.js')?>"></script>
		<script src="<?php echo base_url('theme/js/jquery.counterup.min.js')?>"></script>					
		<script src="<?php echo base_url('theme/js/slick.min.js')?>"></script>
		<script src="<?php echo base_url('theme/js/wow.min.js')?>"></script>		
		<script src="<?php echo base_url('theme/js/script.js')?>"></script>	
	</body>
</html>