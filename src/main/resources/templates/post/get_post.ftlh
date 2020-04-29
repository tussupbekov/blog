<#import '../base_layout.ftlh' as base >
<@base.base_layout>
  <div class="flex justify-between items-center">
    <div class="text-5xl font-bold font-baloo-bhai-2 text-theme-violet mt-4">${post.title}</div>
      <#if isAdmin>
        <div class="flex text-sm items-center">
          <a href="/edit_post/${post.id}" class="flex mr-6 hover:underline"><img src="/icons/edit.svg" class="mr-1"
                                                                                  alt="edit"> Edit</a>
          <a href="/delete_post/${post.id}" class="flex hover:underline"><img src="/icons/delete.svg" class="mr-1"
                                                                              alt="delete"> Delete</a>
        </div>
      </#if>
  </div>
  <div class="text-gray-600">${post.pubDate?string.short}</div>
  <div class="mt-2 text-lg">${post.text}</div>
  <div class="mt-8 mb-3 text-3xl font-bold font-baloo-bhai-2 text-theme-violet">Comments</div>
  <div class="">
      <#list post.comments as comment>
        <div class="w-80 mb-4 py-2 px-4 border border-gray-400 rounded-lg shadow">
          <div class="flex justify-between items-center">
            <div class="text-lg text-blue-800 font-bold">${comment.user.username}</div>
            <div class="text-gray-500 text-xs">${comment.pubDate?string.short}</div>
          </div>
          <div class="mt-2 text-lg">
              ${comment.text}
          </div>
        </div>
      </#list>
      <#if isAuthenticated>
        <form method="post" action="/post_comment">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          <input type="hidden" name="post_id" value="${post.id}">
          <div class="flex">
            <input type="text" placeholder="Leave a comment..." name="text"
                   class="px-6 py-2 text-lg border border-gray-400 rounded-l-full border-r-0 w-80">
            <input type="image" src="/icons/send.svg" alt="send"
                   class="px-3 border border-gray-400 rounded-r-full border-l-0">
          </div>
        </form>
      </#if>
  </div>
</@base.base_layout>