#include <TCanvas.h>
#include <TH1.h>
#include <TH1F.h>
#include <TInterpreter.h>
#include <TMath.h>
#include <TROOT.h>
#include <TTree.h>
#include <fstream>
#include <iostream>
#include <cmath>

void analise() {
    // Ficheiro ROOT pa gardar as cousas
    // std::unique_ptr<TFile> meuFicheiro( TFile::Open("ficheiro.root", "RECREATE") );

    // Árbore de datos
    // TTree *arbore = new TTree("arbore", "Meu Árbore");

    TH1F *hist = new TH1F("histograma","Meu Histograma", 64, -4, 4);
    TF1 *funcion_radiacion = new TF1(
        "Funcion Radiación",
        // "x*[0]+[1]*TMath::Gaus(x,[2],[3])"
        // "[p0]*expo([p1]-[p2]*x)+[p3]*expo(-0.5*((x-[p4])/[p5])*(x-[p4])/[p5]))"
        // "[c1]*exp(-0.5 * ((x-[mu])/[sigma])*((x-[mu])/[sigma]) )"
        "[c1]*x + gaus"
    );
    // funcion_radiacion->SetParNames(
    //     // "Constante 0",
    //     "Constante 1",
    //     "mu",
    //     "sigma"
    // );

    // Cargamos os datos
    // arbore->ReadFile("datos/background_limpo.mca");
    // fstream file;
    // file.open("datos/background_limpo.mca", ios::in);
    // double valor;
    // while(1) {
    //     file >> valor;
    //     hist->Fill(valor);
    //     if (file.eof()) break;
    // }
    // file.close();

    hist->FillRandom("gaus");
    // hist->Rebin();
    auto fit = hist->Fit(funcion_radiacion,"r");
    hist->Draw();
    // fit->Print();
    // fit->Write();
    // c1->SetGridy();
    // c1->GetFrame()->SetFillColor(21);
    // c1->GetFrame()->SetBorderMode(-1);
    // c1->GetFrame()->SetBorderSize(5);
    // TFit *fit = (TFit*)hist->FindObject("fit");
    // TPaveStats *st = (TPaveStats*)hist->FindObject("stats");
    // printf("Integral da gaussiana = %g\n", funcion->Integral(-1, 1));
}
