<#import 'base_layout.ftlh' as base>
<@base.base_layout>
  <div class="text-4xl text-theme-violet mt-6 mb-6 font-semibold font-baloo-bhai-2">${title}</div>
  <div class="mb-4">
      <#list posts as post>
        <div class="border border-gray-400 rounded-lg px-6 py-3 w-96 mt-4 shadow">
          <div><a href="/post/${post.id}"
                  class="text-3xl text-blue-800 font-bold font-baloo-bhai-2 hover:underline">${post.title}</a></div>
          <div class="text-sm text-gray-500 my-1">Published: ${post.pubDate?string.short}</div>
          <div class="text-gray-500">Topic: <a href="/topic/${post.topic}"
                                               class="hover:underline text-theme-violet">${post.topic}</a></div>
        </div>
      </#list>
  </div>
</@base.base_layout>