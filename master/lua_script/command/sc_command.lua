-- server与client交互协议定义

--[[
1.schema文件名就是模块名。如登录模块MODULE_PLAYER中所有协议内容都定义在player.fbs
2.schema中的object名与具体功能协议号相同，并标记服务器或客户端使用。
    如登录功能LOGIN，s2c则为slogin，c2s则为clogin,s2s则为sslogin，当然，也可以使用通用的结构。如empty表示空协议。
3.注意协议号都为大写。这样在代码与容易与其他函数调用区分，并表明它为一个宏定义，不可修改。
4.协议号是一个16bit数字，前8bits表示模块，后8位表示功能。
5.协议必须是一对一。比如c2s协议号是1,那么s2c必须也是1。部分功能不需要对方回包，其他功能也不能占用此协议号。

]]

local MODULE_PLAYER = (0x01 << 8)
local MODULE_BAG    = (0x02 << 8)


local SC =
{
    PLAYER_LOGIN  = { MODULE_PLAYER + 0x01,"player.bfbs","slogin" },
    PLAYER_PING   = { MODULE_PLAYER + 0x02,"player.bfbs","sping" },
    PLAYER_CREATE = { MODULE_PLAYER + 0x03,"player.bfbs","screate_role" },
    PLAYER_ENTER  = { MODULE_PLAYER + 0x04,"player.bfbs","senter_world" },
    PLAYER_OTHER  = { MODULE_PLAYER + 0x05,"player.bfbs","slogin_otherwhere" },
}

local CS =
{
    PLAYER_LOGIN  = { MODULE_PLAYER + 0x01,"player.bfbs","clogin" },
    PLAYER_PING   = { MODULE_PLAYER + 0x02,"player.bfbs","cping" },
    PLAYER_CREATE = { MODULE_PLAYER + 0x03,"player.bfbs","ccreate_role" },
    PLAYER_ENTER  = { MODULE_PLAYER + 0x04,"player.bfbs","center_world" },
    PLAYER_OTHER  = { MODULE_PLAYER + 0x05,"player.bfbs","clogin_otherwhere" },
}

-- 使用oo的define功能让这两个表local后仍能热更
-- 这个表客户端也要用，不要在此文件使用oo.define，在外部使用即可
-- SC = oo.define( _SC,"command_sc" )
-- CS = oo.define( _CS,"command_cs" )


return {SC,CS}
