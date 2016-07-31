//
//  Contato.m
//  AgendaDeContatos
//
//  Created by Fernando Xavier on 7/30/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString *)description {
    NSString *dados = [NSString stringWithFormat:@"Nome: %@ Endereco: %@ Email: %@ Telefone: %@ Site: %@", self.nome, self.endereco, self.email, self.telefone, self.site];
    return dados;
}

/*NSString *nome;

-(void) setNome: (NSString *) novoNome {
    nome = novoNome;
}

-(NSString *) nome {
    return nome;
}*/
@end
