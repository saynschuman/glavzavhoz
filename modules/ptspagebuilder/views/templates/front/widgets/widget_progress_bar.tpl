{*
* Pts Prestashop Theme Framework for Prestashop 1.6.x
*
* @package   ptspagebuilder
* @version   5.0
* @author    http://www.prestabrain.com
* @copyright Copyright (C) October 2013 prestabrain.com <@emai:prestabrain@gmail.com>
*               <info@prestabrain.com>.All rights reserved.
* @license   GNU General Public License version 2
*}
{if $prog_type}
	<div class="widget-progress-bar {$addition_cls} block {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
		{if isset($widget_heading)&&!empty($widget_heading)}
			<h4 class="title_block">
				{$widget_heading}
			</h4>
		{/if}
		<div class="widget-inner block_content">
		{if $prog_type eq 'progress' or $prog_type eq 'progress progress-striped' or $prog_type eq 'progress progress-striped active'}

			{if $success}
			<div class="{$prog_type}">
					{assign var=success value="|"|explode:"$success"}
					<div class="progress-bar progress-bar-{$success.0}" role="progressbar" aria-valuenow="{$success.1}" aria-valuemin="{$success.2}" aria-valuemax="{$success.3}" style="width: {$success.1}%">
						{if $prog_label}
					    	{$success.1}%
					    {else}
					    	<span class="sr-only">{$success.1}% Complete (success)</span>
					    {/if}
					</div>
			</div>
			{/if}

			{if $info}
			<div class="{$prog_type}">
				{assign var=info value="|"|explode:"$info"}
					<div class="progress-bar progress-bar-{$info.0}" role="progressbar" aria-valuenow="{$info.1}" aria-valuemin="{$info.2}" aria-valuemax="{$info.3}" style="width: {$info.1}%">
						{if $prog_label}
					    	{$info.1}%
					    {else}
					    	<span class="sr-only">{$info.1}% Complete</span>
					    {/if}
					</div>
			</div>
			{/if}

			{if $warning}
			<div class="{$prog_type}">
				{assign var=warning value="|"|explode:"$warning"}
					<div class="progress-bar progress-bar-{$warning.0}" role="progressbar" aria-valuenow="{$warning.1}" aria-valuemin="{$warning.2}" aria-valuemax="{$warning.3}" style="width: {$warning.1}%">
						{if $prog_label}
							{$warning.1}%
						{else}
							<span class="sr-only">{$warning.1}% Complete (warning)</span>
						{/if}
					</div>
			</div>
			{/if}

			{if $danger}
			<div class="{$prog_type}">
				{assign var=danger value="|"|explode:"$danger"}	
					<div class="progress-bar progress-bar-{$danger.0}" role="progressbar" aria-valuenow="{$danger.1}" aria-valuemin="{$danger.2}" aria-valuemax="{$danger.3}" style="width: {$danger.1}%">
						{if $prog_label}
							{$danger.1}%
						{else}
							<span class="sr-only">{$danger.1}% Complete (danger)</span>
						{/if}
					</div>
			</div>
			{/if}
		{elseif $prog_type eq 'stacked'}
			<div class="progress progress-striped active">

			  	{if $success}
					{assign var=success value="|"|explode:"$success"}
						<div class="progress-bar progress-bar-{$success.0}" role="progressbar" aria-valuenow="{$success.1}" aria-valuemin="{$success.2}" aria-valuemax="{$success.3}" style="width: {$success.1}%">
							{if $prog_label}
						    	{$success.1}%
						    {else}
						    	<span class="sr-only">{$success.1}% Complete (success)</span>
							{/if}
						</div>
				{/if}

				{if $info}
					{assign var=info value="|"|explode:"$info"}
						<div class="progress-bar progress-bar-{$info.0}" role="progressbar" aria-valuenow="{$info.1}" aria-valuemin="{$info.2}" aria-valuemax="{$info.3}" style="width: {$info.1}%">
							{if $prog_label}
						    	{$info.1}%
						    {else}
						    	<span class="sr-only">{$info.1}% Complete</span>
						    {/if}
						</div>
				{/if}

				{if $warning}
					{assign var=warning value="|"|explode:"$warning"}
						<div class="progress-bar progress-bar-{$warning.0}" role="progressbar" aria-valuenow="{$warning.1}" aria-valuemin="{$warning.2}" aria-valuemax="{$warning.3}" style="width: {$warning.1}%">
							{if $prog_label}
								{$warning.1}%
							{else}
								<span class="sr-only">{$warning.1}% Complete (warning)</span>
							{/if}
						</div>
				{/if}

				{if $danger}
					{assign var=danger value="|"|explode:"$danger"}	
						<div class="progress-bar progress-bar-{$danger.0}" role="progressbar" aria-valuenow="{$danger.1}" aria-valuemin="{$danger.2}" aria-valuemax="{$danger.3}" style="width: {$danger.1}%">
							{if $prog_label}
								{$danger.1}%
							{else}
								<span class="sr-only">{$danger.1}% Complete (danger)</span>
							{/if}
						</div>
				{/if}

			</div>
		{/if}
		</div>
	</div>
{/if}