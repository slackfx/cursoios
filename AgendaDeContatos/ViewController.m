//
//  ViewController.m
//  AgendaDeContatos
//
//  Created by Fernando Xavier on 7/30/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"

@implementation ViewController

-(id) initWithCoder: (NSCoder *) aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if(self) {
        UIBarButtonItem *botao = [[UIBarButtonItem alloc] initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action:@selector(adiciona)];
        self.navigationItem.rightBarButtonItem = botao;
        self.navigationItem.title = @"Novo Contato";
    }
    
    return self;
}

-(void) adiciona {
    Contato *contato = [Contato new];
    
    //[contato setNome:self.nome.text];
    contato.nome = self.nome.text;
    contato.endereco = self.endereco.text;
    contato.email = self.email.text;
    contato.telefone = self.telefone.text;
    contato.site = self.site.text;
    
    [self.contatos addObject:contato];

    NSLog(@"%@", self.contatos);
    [self.navigationController popViewControllerAnimated:YES];
}

@end
