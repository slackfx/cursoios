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
    
    /*NSString *nome = self.nome.text;
    NSString *endereco = self.endereco.text;
    NSString *email = self.email.text;
    NSString *telefone = [self.telefone text];
    NSString *site = [self.site text];*/
    
    NSLog(@"%@", contato);
    [self.navigationController popViewControllerAnimated:YES];
}

@end
