{*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 9771 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}


	{if !isset($logged_on_addons)}

		{if $check_url_fopen eq 'ko'  OR $check_openssl eq 'ko'}
			
			<div class="warn">
				<b>{l s='If you want to be able to fully use the AdminModules pannel and have free modules available, you should enable the following configuration on your server :'}</b><br />
				{if $check_url_fopen eq 'ko'}- {l s='Enable allow_url_fopen'}<br />{/if}
				{if $check_openssl eq 'ko'}- {l s='Enable php openssl extension'}<br />{/if}
			</div>
			
		{else}

			<!--start addons login-->
			<div class="filter-module" id="addons_login_div">
		
				<p>{l s='You have a PrestaShop Addons account ?'}</p>
				<form id="addons_login_form" method="post">
					<label>{l s='Login Addons'} :</label> <input type="text" value="" id="username_addons" autocomplete="off" class="ac_input">
					<label>{l s= 'Password Addons'} :</label> <input type="password" value="" id="password_addons" autocomplete="off" class="ac_input">
					<input type="submit" class="button" id="addons_login_button" value="{l s='Log in'}">
					<span id="addons_loading" style="color:red"></span>
				</form>

			</div>
			<!--end addons login-->

		{/if}

	{/if}


	<!--start filter module-->
	<style>.ac_results { border:1px solid #C2C4D9; }</style>
	<div class="filter-module">
		<form id="filternameForm" method="post">
			<input type="text" value="" name="filtername" autocomplete="off" class="ac_input">
			<input type="submit" class="button" value="{l s='Search'}">
		</form>

		<form method="post">

			<div class="select-filter">
				<label class="search-filter">{l s='Sort by'}:</label>

					<select name="module_type" id="module_type_filter">
						<option value="allModules" {if $showTypeModules eq 'allModules'}selected="selected"{/if}>{l s='All Modules'}</option>
						<option value="nativeModules" {if $showTypeModules eq 'nativeModules'}selected="selected"{/if}>{l s='Native Modules'}</option>
						<option value="partnerModules" {if $showTypeModules eq 'partnerModules'}selected="selected"{/if}>{l s='Partners Modules'}</option>
						<optgroup label="{l s='Authors'}">
							{foreach from=$list_modules_authors key=module_author item=status}
								<option value="authorModules[{$module_author}]" {if $status eq "selected"}selected{/if}>{$module_author|truncate:20:'...'}</option>
							{/foreach}
						</optgroup>
						<option value="otherModules" {if $showTypeModules eq 'otherModules'}selected="selected"{/if}>{l s='Others Modules'}</option>
					</select>
					&nbsp;
					<select name="module_install" id="module_install_filter">
						<option value="installedUninstalled" {if $showInstalledModules eq 'installedUninstalled'}selected="selected"{/if}>{l s='Installed & Uninstalled'}</option>
						<option value="installed" {if $showInstalledModules eq 'installed'}selected="selected"{/if}>{l s='Installed Modules'}</option>
						<option value="uninstalled" {if $showInstalledModules eq 'uninstalled'}selected="selected"{/if}>{l s='Uninstalled Modules'}</option>
					</select>
					&nbsp;
					<select name="module_status" id="module_status_filter">
						<option value="enabledDisabled" {if $showEnabledModules eq 'enabledDisabled'}selected="selected"{/if}>{l s='Enabled & Disabled'}</option>
						<option value="enabled" {if $showEnabledModules eq 'enabled'}selected="selected"{/if}>{l s='Enabled Modules'}</option>
						<option value="disabled" {if $showEnabledModules eq 'disabled'}selected="selected"{/if}>{l s='Disabled Modules'}</option>
					</select>
					&nbsp;
					<select name="country_module_value" id="country_module_value_filter">
						<option value="0" >{l s='All countries'}</option>
						<option value="1" {if $showCountryModules eq 1}selected="selected"{/if}>{l s='Current country:'} {$nameCountryDefault}</option>
					</select>

			</div>

			<div class="button-filter">
				<input type="submit" value="{l s='Reset'}" name="resetFilterModules" class="button" />
				<input type="submit" value="{l s='Filter'}" name="filterModules" class="button" />
			</div>

		</form>

	</div>
	<!--end filter module-->
