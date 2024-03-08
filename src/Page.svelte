<script lang="ts">
  import { beforeUpdate } from "svelte";
  import { pages } from "./generated_pages";
  import { songs } from "./songs";
  interface IIdParams {
    [id: string]: string;
  }

  export let params: IIdParams = {};
  $: heading = "";
  $: body = "<h3>Please select a song from left</h3>";
  let prevsongid = "";
  beforeUpdate(() => {
    const songid = params.id;
    if (prevsongid == songid) return;
    prevsongid = songid;
    if (!songid.length) return;
    heading = songs[songid] || "404 Not found";
    body = pages[songid];
  });
</script>

<svelte:head>
	<title>{heading}</title>
</svelte:head>

<div class="music">
  <div class="heading">
    <h3>{heading}</h3>
    <hr />
  </div>
  <div class="content">
    {@html body}
  </div>
</div>

<style>
  .music {
    overflow: auto;
    height: 100%;
    font-size: 1.8em;
  }
  .heading {
    position: sticky;
    top: 0;
    background: white;
  }
  h3 {
    padding: 0;
    margin: 0;
    padding-left: 0.5em;
  }
  .content {
    padding: 1em;
  }
</style>
