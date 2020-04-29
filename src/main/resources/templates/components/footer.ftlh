<#macro footer>
  <div class="bg-theme-green text-white text-sm">
    <div class="container mx-auto py-4">
      <div class="flex mb-2">
        <div>
          <div class="font-bold">Content:</div>
          <div class="">HTML</div>
          <div class="">CSS</div>
          <div class="">JavaScript</div>
          <div class="">React</div>
          <div class="">UX/UI</div>
        </div>
        <div class="ml-12">
          <div class="font-bold">About:</div>
          <div class="">Our Contacts</div>
          <div class="">About us</div>
          <div class="">Admin</div>
          <#if isAdmin><div class=""><a href="/add_post" class="hover:underline">Add Post</a></div></#if>
        </div>
      </div>
      <div>© Dastish & Tima, 2020</div>
    </div>
  </div>
</#macro>