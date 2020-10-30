{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v8.0&appId=819624071393289&autoLogAppEvents=1" nonce="ueZXW7Mi"></script>
{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="row fiche-produit">
      <div class="col-md-6">
        {block name='page_content_container'}
          <section class="page-content fiche-container" id="content">
            {block name='page_content'}
              <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->
              {block name='product_flags'}
                <ul class="product-flags txt-head-fiche">
                    <li class="product-flag txt-dessus-image">Lorem ipsum dolor sit amet, consectetur adipiscing elit</li>
                </ul> 
                <ul class="product-flags">
                  {foreach from=$product.flags item=flag}
                    <li class="product-flag {$flag.type}">{$flag.label}</li>
                  {/foreach}
                </ul>
              {/block}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
              
              <div class="scroll-box-arrows">
                <i class="material-icons left">&#xE314;</i>
                <i class="material-icons right">&#xE315;</i>
              </div>

            {/block}
          </section>
        {/block}
        <div class="container-txt">
          <ul class="product-flags txt-head-fiche">
            <li class="product-flag txt-dessus-image">Lorem ipsum dolor sit amet, consectetur adipiscing elit</li>
          </ul> 
        </div>
        

        {block name='product_tabs'}
              <div class="tabs">
                <ul class="nav nav-tabs" role="tablist">
                  {if $product.description}
                    <li class="nav-item">
                       <a
                         class="nav-link{if $product.description} active{/if}"
                         data-toggle="tab"
                         href="#description"
                         role="tab"
                         aria-controls="description"
                         {if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
                    </li>
                  {/if}
                  <li class="nav-item">
                    <a
                      class="nav-link{if !$product.description} active{/if}"
                      data-toggle="tab"
                      href="#product-details"
                      role="tab"
                      aria-controls="product-details"
                      {if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
                  </li>
                  {if $product.attachments}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#attachments"
                        role="tab"
                        aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
                    </li>
                  {/if}
                  {foreach from=$product.extraContent item=extra key=extraKey}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#extra-{$extraKey}"
                        role="tab"
                        aria-controls="extra-{$extraKey}">{$extra.title}</a>
                    </li>
                  {/foreach}
                </ul>

                <div class="tab-content" id="tab-content">
                 <div class="tab-pane fade in{if $product.description} active{/if}" id="description" role="tabpanel">
                   {block name='product_description'}
                     <div class="product-description">{$product.description nofilter}</div>
                   {/block}
                 </div>

                 {block name='product_details'}
                   {include file='catalog/_partials/product-details.tpl'}
                 {/block}

                 {block name='product_attachments'}
                   {if $product.attachments}
                    <div class="tab-pane fade in" id="attachments" role="tabpanel">
                       <section class="product-attachments">
                         <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                         {foreach from=$product.attachments item=attachment}
                           <div class="attachment">
                             <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                             <p>{$attachment.description}</p
                             <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                               {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                             </a>
                           </div>
                         {/foreach}
                       </section>
                     </div>
                   {/if}
                 {/block}

                 {foreach from=$product.extraContent item=extra key=extraKey}
                 <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                   {$extra.content nofilter}
                 </div>
                 {/foreach}
              </div>  
            </div>
          {/block}
          
        </div>
        <div class="col-md-6">
          <div class="row">
            <div class="col-md-12">
              {block name='page_header_container'}
                {block name='page_header'}
                  <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
                {/block}
              {/block}
            </div>
          </div>
          <div class="row">
            <div class="col-md-7">
              <div class="bloc-prix-fiche">
                <div class="row">
                  <div class="col-xs-5">
                    {if $product.cover}
                      {if isset($manufacturer_image_url)}
                        <a href="{$product_brand_url}" class="a-logo-product">
                        <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo logo-product img-responsive" alt="{$product_manufacturer->name}">
                        </a>
                      {/if}  
                    {/if}
                  </div>
                  <div class="col-xs-7 margin-top7">
                    <div class="rs-fiche">
                      <div class="add-favorite-product">
                        <input type="checkbox" id="checkbox{$product.id}" />
                        <label for="checkbox{$product.id}">
                          <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
                            <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
                              <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z" id="heart" fill="#AAB8C2"/>
                              <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5" cy="29.5" r="1.5"/>

                              <g id="grp7" opacity="0" transform="translate(7 6)">
                                <circle id="oval1" fill="#9CD8C3" cx="2" cy="6" r="2"/>
                                <circle id="oval2" fill="#8CE8C3" cx="5" cy="2" r="2"/>
                              </g>

                              <g id="grp6" opacity="0" transform="translate(0 28)">
                                <circle id="oval1" fill="#CC8EF5" cx="2" cy="7" r="2"/>
                                <circle id="oval2" fill="#91D2FA" cx="3" cy="2" r="2"/>
                              </g>

                              <g id="grp3" opacity="0" transform="translate(52 28)">
                                <circle id="oval2" fill="#9CD8C3" cx="2" cy="7" r="2"/>
                                <circle id="oval1" fill="#8CE8C3" cx="4" cy="2" r="2"/>
                              </g>

                              <g id="grp2" opacity="0" transform="translate(44 6)">
                                <circle id="oval2" fill="#CC8EF5" cx="5" cy="6" r="2"/>
                                <circle id="oval1" fill="#CC8EF5" cx="2" cy="2" r="2"/>
                              </g>

                              <g id="grp5" opacity="0" transform="translate(14 50)">
                                <circle id="oval1" fill="#91D2FA" cx="6" cy="5" r="2"/>
                                <circle id="oval2" fill="#91D2FA" cx="2" cy="2" r="2"/>
                              </g>

                              <g id="grp4" opacity="0" transform="translate(35 50)">
                                <circle id="oval1" fill="#F48EA7" cx="6" cy="5" r="2"/>
                                <circle id="oval2" fill="#F48EA7" cx="2" cy="2" r="2"/>
                              </g>

                              <g id="grp1" opacity="0" transform="translate(24)">
                                <circle id="oval1" fill="#9FC7FA" cx="2.5" cy="3" r="2"/>
                                <circle id="oval2" fill="#9FC7FA" cx="7.5" cy="2" r="2"/>
                              </g>
                            </g>
                          </svg>
                        </label>
                      </div>
                      <!-- /add-favorite-product --> 
                      <div>
                      {block name='product_additional_info'}
                        {include file='catalog/_partials/product-additional-info.tpl'}
                      {/block}
                      </div>
                      <div class="prix-fiche">
                        {$product.price}
                      </div>
                      <div class="discount-fiche">
                      {if $product.has_discount}
                        
                        {if $product.discount_type === 'percentage'}
                          <span class="discount discount-percentage discount-green">{l s='Réduction -%percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $product.discount_percentage_absolute]}</span>
                        {else}
                          <span class="discount discount-amount discount-green">
                              {l s='Réduction -%amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.discount_to_display]}
                          </span>
                        {/if}
                      {/if}
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-md-12">
                    <div class="guide-dimension">
                      {block name='product_variants'}
                        {include file='catalog/_partials/product-variants.tpl'}
                      {/block} 
                    </div>
                  </div>
                </div>
                <div class="separation-label"></div> 
                <div class="row row-width100">
                  <div class="col-md-12 width100">
                    {block name='product_footer'}
                      {hook h='displayFooterProduct' product=$product category=$category}
                    {/block}
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-5">
              
              {block name='product_prices'}
                {include file='catalog/_partials/product-prices.tpl'}
              {/block}

              <div class="product-information">
                {block name='product_description_short'}
                  <div id="product-description-short-{$product.id}" itemprop="description">{$product.description_short nofilter}</div>
                {/block}

                {if $product.is_customizable && count($product.customizations.fields)}
                  {block name='product_customization'}
                    {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                  {/block}
                {/if}

                <div class="product-actions">
                  {block name='product_buy'}
                    <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                      <input type="hidden" name="token" value="{$static_token}">
                      <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                      <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                      

                      

                      {block name='product_discounts'}
                        {include file='catalog/_partials/product-discounts.tpl'}
                      {/block}

                      {block name='product_add_to_cart'}
                        {include file='catalog/_partials/product-add-to-cart.tpl'}
                      {/block}

                      <!--
                      {block name='hook_display_reassurance'}
                        {hook h='displayReassurance'}
                      {/block}
                      --> 

                      {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                      {block name='product_refresh'}{/block}
                    </form>
                  {/block}

                </div>

                
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              {block name='product_pack'}
                {if $packItems}
                  <section class="product-pack">
                    <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                    {foreach from=$packItems item="product_pack"}
                      {block name='product_miniature'}
                        {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                      {/block}
                    {/foreach}
                </section>
                {/if}
              {/block}
            </div>
          </div>

            
        </div>
      </div>
    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
          <p class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
          <div class="products">
            {foreach from=$accessories item="product_accessory"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>
  <style>      
 #checkbox{$product.id} {
    display: none;
  }
  
  #checkbox{$product.id}:checked + label svg #heart {
    transform: scale(0.2);
    fill: #e2264d;
    animation: animateHeart 0.3s linear forwards 0.25s;
  }
  #checkbox{$product.id}:checked + label svg #main-circ {
    transition: all 2s;
    animation: animateCircle 0.3s linear forwards;
    opacity: 1;
  }
  #checkbox{$product.id}:checked + label svg #grp1 {
    opacity: 1;
    transition: 0.1s all 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp1 #oval1 {
    transform: scale(0) translate(0, -30px);
    transform-origin: 0 0 0;
    transition: 0.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp1 #oval2 {
    transform: scale(0) translate(10px, -50px);
    transform-origin: 0 0 0;
    transition: 1.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp2 {
    opacity: 1;
    transition: 0.1s all 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp2 #oval1 {
    transform: scale(0) translate(30px, -15px);
    transform-origin: 0 0 0;
    transition: 0.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp2 #oval2 {
    transform: scale(0) translate(60px, -15px);
    transform-origin: 0 0 0;
    transition: 1.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp3 {
    opacity: 1;
    transition: 0.1s all 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp3 #oval1 {
    transform: scale(0) translate(30px, 0px);
    transform-origin: 0 0 0;
    transition: 0.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp3 #oval2 {
    transform: scale(0) translate(60px, 10px);
    transform-origin: 0 0 0;
    transition: 1.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp4 {
    opacity: 1;
    transition: 0.1s all 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp4 #oval1 {
    transform: scale(0) translate(30px, 15px);
    transform-origin: 0 0 0;
    transition: 0.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp4 #oval2 {
    transform: scale(0) translate(40px, 50px);
    transform-origin: 0 0 0;
    transition: 1.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp5 {
    opacity: 1;
    transition: 0.1s all 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp5 #oval1 {
    transform: scale(0) translate(-10px, 20px);
    transform-origin: 0 0 0;
    transition: 0.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp5 #oval2 {
    transform: scale(0) translate(-60px, 30px);
    transform-origin: 0 0 0;
    transition: 1.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp6 {
    opacity: 1;
    transition: 0.1s all 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp6 #oval1 {
    transform: scale(0) translate(-30px, 0px);
    transform-origin: 0 0 0;
    transition: 0.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp6 #oval2 {
    transform: scale(0) translate(-60px, -5px);
    transform-origin: 0 0 0;
    transition: 1.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp7 {
    opacity: 1;
    transition: 0.1s all 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp7 #oval1 {
    transform: scale(0) translate(-30px, -15px);
    transform-origin: 0 0 0;
    transition: 0.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp7 #oval2 {
    transform: scale(0) translate(-55px, -30px);
    transform-origin: 0 0 0;
    transition: 1.5s transform 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp2 {
    opacity: 1;
    transition: 0.1s opacity 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp3 {
    opacity: 1;
    transition: 0.1s opacity 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp4 {
    opacity: 1;
    transition: 0.1s opacity 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp5 {
    opacity: 1;
    transition: 0.1s opacity 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp6 {
    opacity: 1;
    transition: 0.1s opacity 0.3s;
  }
  #checkbox{$product.id}:checked + label svg #grp7 {
    opacity: 1;
    transition: 0.1s opacity 0.3s;
  }
</style>

{/block}