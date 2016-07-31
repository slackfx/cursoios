//
//  ContatoDAO.m
//  AgendaDeContatos
//
//  Created by Fernando Xavier on 7/31/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import "ContatoDAO.h"

@implementation ContatoDAO

static ContatoDAO *defaultDAO = nil;

-(id) init {
    self = [super init];
    if (self) {
        self.contatos = [NSMutableArray new];
    }
    return self;
}

+(ContatoDAO *) contatoDAOInstance {
    if (!defaultDAO) {
        defaultDAO = [ContatoDAO new];
    }
    return defaultDAO;
}

-(void) adicionaContato:(Contato *)contato {
    [self.contatos addObject:contato];
}

-(NSInteger) total {
    return self.contatos.count;
}

-(Contato *) contatoDoIndice: (NSInteger) indice {
    return self.contatos[indice];
}

- (void)removeContato:(Contato *)contato {
    [self.contatos removeObject:contato];
}

-(NSInteger) indiceDoContato: (Contato *) contato {
    return [self.contatos indexOfObject:contato];
}

@end
