<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/style.css"
   property="stylesheet" />
<script>
   jQuery(document).ready(function () {
      jQuery('#btnShowSidebar').click(function () {
         if (jQuery("#premiumComparisonSidebar").is(":visible")) {
            jQuery('#premiumComparisonContent').removeClass('col-md-9').addClass('col-md-12');
            jQuery('#premiumComparisonSidebar').addClass('hidden-xs').fadeOut();
            jQuery('#btnShowSidebar')
               .html('<i class="fas fa-arrow-circle-right"></i> {$LANG.showMenu}');
         } else {
            jQuery('#premiumComparisonContent').removeClass('col-md-12').addClass('col-md-9');
            jQuery('#premiumComparisonSidebar').removeClass('hidden-xs').fadeIn();
            jQuery('#btnShowSidebar')
               .html('<i class="fas fa-arrow-circle-left"></i> {$LANG.hideMenu}');
         }
      });
   });
</script>

<div class="row">

   <div class="text-center">

      {if $showSidebarToggle}
      <button type="button" class="btn btn-default btn-sm pull-left" id="btnShowSidebar">
         <i class="fas fa-arrow-circle-right"></i> {$LANG.showMenu}
      </button>
      {/if}

      <h2 id="headline">
         {if $productGroup.headline}
         {$productGroup.headline}
         {else}
         {$productGroup.name}
         {/if}
      </h2>
      {if $productGroup.tagline}
      <h4 id="tagline">
         {$productGroup.tagline}
      </h4>
      {/if}
      {if $errormessage}
      <div class="alert alert-danger">
         {$errormessage}
      </div>
      {/if}
   </div>

</div>
<!-- row-product-selection -->
<div class="row ">
   <div id="premiumComparisonSidebar" class="col-xs-12 col-md-3 product-selection-sidebar hidden-xs hidden-sm">
      {include file="orderforms/standard_cart/sidebar-categories.tpl"}
   </div>
   <div id="premiumComparisonContent" class="col-xs-12 col-md-9">

      <div id="order-premium_comparison">
         <div class="main-container price-01">
            <!-- <div class="txt-center">
               <h3 id="headline">
                  {if $productGroup.headline}
                  {$productGroup.headline}
                  {else}
                  {$productGroup.name}
                  {/if}
               </h3>
               {if $productGroup.tagline}
               <h5 id="tagline">
                  {$productGroup.tagline}
               </h5>
               {/if}
               {if $errormessage}
               <div class="alert alert-danger">
                  {$errormessage}
               </div>
               {/if}
            </div> -->
            <div id="products" class="price-table-container">
               <ul class="row">
                  {foreach $products as $product}
                  <li id="product{$product@iteration}" class="col-xs-12 col-sm-6 col-md-4">
                     <div class="price-table">
                        <div class="top-head">
                           <div class="top-area">
                              <h4 id="product{$product@iteration}-name">{$product.name}</h4>
                           </div>
                           {if $product.tagLine}
                           <p id="product{$product@iteration}-tag-line">{$product.tagLine}</p>
                           {/if}
                           {if $product.isFeatured}
                           <div class="popular-plan">
                              {$LANG.featuredProduct|upper}
                           </div>
                           {/if}

                           <div class="price-area">
                              <div class="price" id="product{$product@iteration}-price">
                                 {if $product.bid}
                                 {$LANG.bundledeal}
                                 {if $product.displayprice}
                                 <br /><br /><span>{$product.displayPriceSimple}</span>
                                 {/if}
                                 {elseif $product.paytype eq "free"}
                                 {$LANG.orderfree}
                                 {elseif $product.paytype eq "onetime"}
                                 {$product.pricing.onetime} {$LANG.orderpaymenttermonetime}
                                 {else}
                                 {if $product.pricing.hasconfigoptions}
                                 {$LANG.from}
                                 {/if}
                                 {$product.pricing.minprice.cycleText}
                                 <br>
                                 {if $product.pricing.minprice.setupFee}
                                 <small>{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
                                 {/if}
                                 {/if}
                              </div>
                              {if $product.qty eq "0"}
                              <span id="product{$product@iteration}-unavailable"
                                 class="order-button unavailable">{$LANG.outofstock}</span>
                              {else}
                              <a href="{$smarty.server.PHP_SELF}?a=add&amp;{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}"
                                 class="btn btn-block btn-default" id="product{$product@iteration}-order-button">
                                 {$LANG.ordernowbutton}
                              </a>
                              {/if}

                           </div>
                        </div>
                        <ul>
                           {foreach $product.features as $feature => $value}
                           <li id="product{$product@iteration}-feature{$value@iteration}">
                              {$value} {$feature}
                           </li>
                           {foreachelse}
                           <li id="product{$product@iteration}-description">
                              {$product.description}
                           </li>
                           {/foreach}
                        </ul>
                     </div>
                  </li>
                  {/foreach}
               </ul>
            </div>
         </div>
         {if count($productGroup.features) > 0}
         <div class="includes-features">
            <div class="row clearfix">
               <div class="col-md-12">
                  <div class="head-area">
                     <span>
                        {$LANG.orderForm.includedWithPlans}
                     </span>
                  </div>
                  <ul class="list-features">
                     {foreach $productGroup.features as $features}
                     <li>{$features.feature}</li>
                     {/foreach}
                  </ul>
               </div>
            </div>
         </div>
         {/if}
      </div>

   </div>
</div>