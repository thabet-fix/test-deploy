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
 
{$brandName = Manufacturer::getnamebyid($product.id_manufacturer)}

{$product|var_dump}
{$brandUrl = Context::getContext()->link->getManufacturerImageLink($product.id_manufacturer)}
{$brandUrlNull = Context::getContext()->link->getManufacturerImageLink(null)}

{block name='product_miniature_item'}
  <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">
      {block name='product_thumbnail'}
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
        <div class="zone-haut">Collection impérial</div>
        <a href="{$product.url}" class="vignette-plus">En savoir plus</a>
        {if $product.cover}
          {if ($brandUrl !== $brandUrlNull)}
            
            <img src="{$brandUrl}" class="logo-vignette" alt="{$brandName}">
            
          {/if}  
          <a href="{$product.url}" class="thumbnail product-thumbnail">
            <img
              src="{$product.cover.bySize.home_default.url}"
              alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
              data-full-size-image-url="{$product.cover.large.url}"
            />
          </a>
        {else}
          <a href="{$product.url}" class="thumbnail product-thumbnail">
            <img src="{$urls.no_picture_image.bySize.home_default.url}" />
          </a>
        {/if}
      {/block}

      <div class="product-description">
        {block name='product_name'}
          {if $page.page_name == 'index'}
            <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$brandName} {$product.name|truncate:30:'...'}</a></h3>
          {else}
            <h2 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$brandName} {$product.name|truncate:30:'...'}</a></h2>
          {/if}
          <div class="separation-nom"></div>
        {/block}

        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping">
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                
                {if $product.discount_type === 'percentage'}
                  <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                {elseif $product.discount_type === 'amount'}
                  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                {/if}

                <span class="regular-price">{$product.regular_price}</span>
                
              {/if}

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

              <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
              <span itemprop="price" class="price">{$product.price}</span>

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              {hook h='displayProductPriceBlock' product=$product type='weight'}
            </div>
          {/if}
        {/block}

        {block name='product_reviews'}
          {hook h='displayProductListReviews' product=$product}
        {/block}
      </div>

      <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->
      {block name='product_flags'}

        {if $product.discount_amount_to_display == 0}
        <ul class="product-flags">
          
            <li class="product-flag discount"><span class="add-promo">PAS DE PRIX</span></li>
          
        </ul>
        {/if}
        

        <ul class="product-flags">
          {foreach from=$product.flags item=flag}
            <li class="product-flag {$flag.type}"><span class="add-promo">{$flag.label}</span></li>
          {/foreach}
        </ul>

      {/block}
      <ul class="product-flags flags2">
          {foreach from=$product.features item=feature}
            {if $feature.name == "Comfort"}
            <li class="product-flag {$feature.name}"><span class="add-promo">{$feature.value}</span></li>
            {/if}
          {/foreach}
      </ul>

      <div class="livraison-vignette">
      LIVRAISON 72H CHRONO GRATUITE
      </div>

      
      <!--<div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
        {block name='quick_view'}
          <a class="quick-view" href="#" data-link-action="quickview">
            <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}
          </a>
        {/block}

        {block name='product_variants'}
          {if $product.main_variants}
            {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
          {/if}
        {/block}
      </div>
      -->
    </div>
  </article>
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
