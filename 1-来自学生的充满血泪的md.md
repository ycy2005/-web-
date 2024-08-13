这个md文稿充满学生的血泪，确信。

写在最前面的话：因为我用的是vscode（为了保命疯狂加粗），所以用其他开发软件以及用苹果会发生什么，那我是完全不清楚，可能要老师你自己摸索了。

额，首先，我的程序用的是vue而不是react，因为我上知乎搜了下，这个似乎在国内更通用？（信息茧房可能性存疑）并且老师你那几天教的也更多的是理论性和通用性的东西，我改换门路只能说相当的快捷（因为我原本基础就不扎实（划掉））。还看到另一种说法，即vue上手快捷，而react更考虑js功底，考虑到上课前根本就没有js功底，我觉得还是，嗯，老师你懂的。

然后，我用的是mysql来作为数据管理系统，老师你在虚拟机上的时候，如果手上还没下，可能要现下一个，然后设完密码后，记得在server/api-service/db/db.js里把密码改成你mysql的密码，虽然我觉得这种约定俗成的东西老师你多半不用我讲就能知道了。

之后是“下”点“小东西”，具体地说，npm install -g nodemon

再然后是神必的powershell问题，如果运行命令行时出现：
PS C:劈里啪啦一大坨地址\server> nodemon app.js
nodemon : 无法加载文件 C:\Users\17282\AppData\Roaming\npm\nodemon.ps1，因为在此系统上禁止运行脚本。有关详细信息，请参阅 https:/go.microsoft.com/fwlink/?LinkID=135170 中的 about_Execution_Policies。
所在位置 行:1 字符: 1
+ nodemon app.js
+ ~~~~~~~
    + CategoryInfo          : SecurityError: (:) []，PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess
这种，记得去admin打开的windows powershell上把你的脚本运行给放开，具体地说，是这段：PS C:\windows\system32> Set-ExecutionPolicy Unrestricted，然后选择Y/是。
//上面这个似乎不应该放这里，而是该放在倒数第二段前，但是算了，不想排版了，本身也就是个随笔，老师你就将就着看看吧。

我在链接数据库时还用到了Navicat Premium 17，不过是试用。老师你肯定知道这是干什么用的以及有哪些替代品，所以我就不多赘述了。

最后，成功的搞定了以上的一切，剩下的是控制台的部分，在前端（web）上，npm run dev，在后端（server/api-service）处nodemon app.js（这里其实要开两个控制台），大功告成（×）下班收工（✔）。

颠三倒四，词不达意的写了这么多，老师您看过就算是笑过吧。不过还是建议老师，先看完2，再去登录。