#ifndef __LSTATISTIC_H__
#define __LSTATISTIC_H__

#include <lua.hpp>
#include "../system/statistic.h"

class lstatistic
{
public:
    static int32 dump( lua_State *L );
private:
    static void dump_thread( lua_State *L );
    static void dump_base_counter( 
        const statistic::base_counter_t &counter,lua_State *L );
};

extern int32 luaopen_statistic( lua_State *L );

#endif /* __LSTATISTIC_H__ */
