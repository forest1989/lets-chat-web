package com.thinkgem.jeesite.simpletoken;

public interface PackableEx extends Packable {
    void unmarshal(ByteBuf in);
}
