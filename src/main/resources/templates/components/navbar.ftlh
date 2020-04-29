<#macro navbar>
  <nav class="h-16 w-full bg-theme-green text-white flex items-center justify-between px-12">
    <div class="text-4xl font-semibold font-baloo-bhai-2"><a href="/">FrontendTricks</a></div>
    <div class="flex">
      <div class="text-xl mr-6"><a href="/topic/HTML">HTML</a></div>
      <div class="text-xl mr-6"><a href="/topic/CSS">CSS</a></div>
      <div class="text-xl mr-6"><a href="/topic/JavaScript">JavaScript</a></div>
      <div class="text-xl mr-6"><a href="/topic/React">React</a></div>
      <div class="text-xl mr-12"><a href="/topic/Vue">Vue</a></div>
      <div class="">
          <#if isAuthenticated>
            <div class="flex items-center">
              <div class="flex"><img src="/icons/account.svg" class="h-6 w-6" alt="account"><div>${username}</div></div>
              <div class="h-8 bg-white mx-3" style="width: 1px"></div>
              <form method="post" action="/logout" class="m-0">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <button type="submit" class="flex"><img class="h-6 w-6" src="/icons/logout.svg" alt="logout"><span>logout</span></button>
              </form>
            </div>
          <#else>
            <a href="/login" class="flex items-center"><img src="/icons/login.svg" alt="login" class="h-5 w-5"><span>Log in</span></a>
          </#if>
      </div>
    </div>
  </nav>
</#macro>