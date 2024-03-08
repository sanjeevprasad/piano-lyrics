<script lang="ts">
	import Router, { link } from "svelte-spa-router";
	import active from "svelte-spa-router/active";
	import { songs } from "./songs";
	import NotFound from "./NotFound.svelte";
	import Page from "./Page.svelte";
	const songids = Object.keys(songs);
	const routes = {
		"/:id": Page,
		"*": NotFound,
	};
</script>

<div class="nav">
	<ul>
		{#each songids as songid}
			<li>
				<a class="active" href="/{songid}" use:link use:active
					>{songs[songid]}</a
				>
			</li>
		{/each}
	</ul>
</div>
<div class="contents">
	<Router {routes} />
</div>

<style>
	.nav {
		position: absolute;
		left: 0;
		top: 0;
		bottom: 0;
		width: 500px;
		overflow: auto;
	}
	ul {
		width: 100%;
	}
	li a {
		width: 100%;
		padding: 0.25em 0.5em;
	}
	li a.active {
		font-weight: bold;
		background: var(--color-lightGrey);
	}
	.contents {
		position: absolute;
		left: 500px;
		right: 0;
		top: 0;
		bottom: 0;
	}
	ul {
		margin: 0;
		padding: 0;
		list-style: none;
	}
</style>
